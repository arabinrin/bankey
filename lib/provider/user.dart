import 'package:bankey/helper/user.dart';
import 'package:bankey/model/http_exception.dart';
import 'package:bankey/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;



enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class UserProvider with ChangeNotifier {
   String? _token;
  DateTime? _expiredate;
  String? _userId;
  Timer? _authTimer;
  FirebaseAuth _auth;
  User? _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel? _userModel;


  String? get token {
    if (_expiredate != null &&
        _expiredate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  bool get isAuth {
    return _token != null;
  }

  String? get userId {
    return _userId;
  }

 Future<void> _authenticate(
      String email, String pass, String urlSegment) async {
    final url = Uri.parse(
        //Todo add your API KEY
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=");

    try {
      //Send a request to signIn or signUp
      final res = await http.post(url,
          body: json.encode({
            'email': email,
            'password': pass,
            'returnSecureToken': true,
          }));
      //get data back
      final resData = json.decode(res.body);
      //for catching error
      if (resData['error'] != null) {
        //HttpException is a class to return the message
        throw HttpException(resData['error']['message']);
      }
      if (urlSegment == "signInWithPassword") {
        _token = resData['idToken'];
        _userId = resData['localId'];
        _expiredate = DateTime.now()
            .add(Duration(seconds: int.parse(resData['expiresIn'])));
        notifyListeners(); //any time values is changes

        //Simple store of data
        // SharedPreferencces prefs = await SharedPreferences.getInstance();
        // final autoData = json.encode({
        //   'token': _token,
        //   'userId': _userId,
        //   '_expiredate': _expiredate!.toIso8601String()
        // });
        // prefs.setString('autoData', autoData);
      }
    } catch (e) {
      rethrow;
    }
  }



  Status get status => _status;
  UserModel? get userModel => _userModel;
  User? get user => _user;
  final formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((_onstateChanged));
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return _onError(e.toString());
    }
  }

  Future<void> signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').doc(result.user?.uid).set({
          "name": name.text,
          "email": email.text,
          "id": result.user?.uid,
          "Job": [],
          "Note": [],
        });
        // Map<String, dynamic> values = {

        // };
        // _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      return _onError(e.toString());
    }
  }

  bool _onError(String e) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print(e);
    return false;
  }

  void cleanController() {
    email.text = "";
    password.text = "";
    name.text = "";
  }

  Future<void> _onstateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }
}
