// @dart=2.9

import 'dart:async';
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  bool isAuthenticated = false;
  final storedPasscode = '142536';

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteback,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are ${isAuthenticated ? '' : 'not'}'
              ' authenticated',
              style: const TextStyle(fontSize: 16),
            ),
           const SizedBox(
              height: 10,
            ),
            _lockScreenButton(context),
          ],
        ),
      ),
    );
  }

  _lockScreenButton(BuildContext context) => MaterialButton(
        padding: const EdgeInsets.only(left: 50, right: 50),
        color: Theme.of(context).primaryColor,
        child: const Text(
          'Lock Screen',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        onPressed: () {
          _showLockScreen(
            context,
            opaque: false,
            cancelButton: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              semanticsLabel: 'Cancel',
            ),
          );
        },
      );

  _showLockScreen(BuildContext context,
      {bool opaque,
      Widget cancelButton,
      CircleUIConfig circleUIConfig,
      KeyboardUIConfig keyboardUIConfig,
      List<String> digits}) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: const Text(
              'Enter Passcode',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _passcodeEntered,
            cancelButton: cancelButton,
            deleteButton: const Text(
              'Delete',
              style: TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _passcodeCancelled,
            digits: digits,
            passwordDigits: 6,
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
            child: const Text(
              "Reset passcode",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            splashColor: Colors.white.withOpacity(0.4),
            highlightColor: Colors.white.withOpacity(0.2),
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
          title: const Text(
            "Reset passcode",
            style: const TextStyle(color: Colors.black87),
          ),
          content: const Text(
            "Passcode reset is a non-secure operation!\nAre you sure want to reset?",
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: const Text(
                "Cancel",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            FlatButton(
              child: const Text(
                "I proceed",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }
}
