import 'dart:async';

import 'package:bankey/screens/number_sign_up.dart';
import 'package:bankey/screens/summary.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class Fingerprint extends StatefulWidget {
  const Fingerprint({Key? key}) : super(key: key);

  @override
  _FingerprintState createState() => _FingerprintState();
}

final _auth = FirebaseAuth.instance;

class _FingerprintState extends State<Fingerprint> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool isAuthenticated = false;
  final storedPasscode = '1234';

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = true;
  List<BiometricType> _availableBiometric = [];
  String authorized = "Not authorized";

  Future<void> _checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometric() async {
    late List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: "Scan your finger to authenticate",
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      authorized = authenticated ? "Authorized" : " to authenticate";
      print(authorized);
      if (authenticated) {
        changeScreenReplacement(context,const Summary());
      }
    });
  }

  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: IconButton(
                          onPressed: () async {
                            await _auth.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>const NumberLog()));
                          },
                          icon:const Icon(Icons.logout))),
                ]),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Image.asset(
                'images/finger.png',
                width: 260,
                height: 260,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome back to Bankey',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: kBlack,
                ),
              
              ),
              textAlign:TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Activate touch ID so you don’t need to confirm your PASSCODE every time you want to use Bankey',
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: _authenticate,
              child: Button(
                color: kprimarycolor,
                title: 'Fingerprint',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _showLockScreen(
                  context,
                  keyboardUIConfig:const KeyboardUIConfig(
                    digitFillColor: Colors.transparent,
                    digitInnerMargin: const EdgeInsets.all(10),
                    digitTextStyle:
                         TextStyle(fontSize: 30, color: Colors.black),
                    digitBorderWidth: 0,
                    primaryColor: Colors.transparent,
                  ),
                  circleUIConfig: CircleUIConfig(
                      borderColor: kprimarycolor,
                      fillColor: kprimarycolor,
                      circleSize: 20),
                  opaque: true,
                  cancelButton:const Text(
                    'Cancel',
                    style:  TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    semanticsLabel: 'Cancel',
                  ),
                );
              },
              child: Button(
                color: kBlack,
                title: 'Passcode',
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showLockScreen(BuildContext context,
      {bool opaque = true,
      Widget cancelButton = const Text(
        'Cancel',
      ),
      CircleUIConfig? circleUIConfig,
      KeyboardUIConfig? keyboardUIConfig,
      List<String>? digits}) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Text(
              'Enter Passcode',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kBlack,
                ),
              ),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _passcodeEntered,
            cancelButton: cancelButton,
            deleteButton: Text(
              'Delete',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: kBlack,
                ),
              ),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: whiteback,
            cancelCallback: _passcodeCancelled,
            digits: digits,
            passwordDigits: 4,
            bottomWidget: _passcodeRestoreButton(),
          ),
        ));
  }

  _passcodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });
      changeScreenReplacement(context, Summary());
    }
  }

  _passcodeCancelled() {
    Navigator.maybePop(context);
  }

  _passcodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: FlatButton(
            child: Text(
              'Reset Passcode',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kBlack,
                ),
              ),
            ),
            splashColor: kBlack,
            highlightColor: kBlack,
            onPressed: _resetApplicationPassword,
          ),
        ),
      );

  _resetApplicationPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _restoreDialog(() {
        Navigator.maybePop(context);
      });
    });
  }

  _restoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[50],
          title: Text(
            'Reset Passcode',
            style: GoogleFonts.dmSans(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: kBlack,
              ),
            ),
          ),
          content: Text(
                    'Passcode reset is a non-secure operation!\nAre you sure want to reset?',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kBlack,
                      ),
                    ),),
         
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child:  Text(
                    'Cancel',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kBlack,
                      ),
                    ),),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            FlatButton(
              child: Text(
                    'I proceed',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kBlack,
                      ),
                    ),),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }
}
