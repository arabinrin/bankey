import 'package:bankey/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  String collection = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values['id'];

    _firestore.collection(collection).doc(id).set(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    String id = values['id'];

    _firestore.collection(collection).doc(id).update(values);
  }

  Future<UserModel> getUserById(String id) => _firestore
      .collection(collection)
      .doc(id)
      .get()
      .then((value) => UserModel.fromSnapshot(value));
}
