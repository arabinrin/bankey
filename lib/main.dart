import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bankey/screens/fingerprint.dart';
import 'package:bankey/screens/signup.dart';
import 'package:bankey/screens/splash.dart';
import 'package:bankey/screens/summary.dart';
import 'package:bankey/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: kprimarycolor, fontFamily: 'DM sans'),
      home: Initializer(),
    );
  }
}

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 500,
      backgroundColor: kBackground,
      splash: Splash(),
      nextScreen: SignUp(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 2000,
    );
  }
}

class Initializer extends StatefulWidget {
  const Initializer({Key? key}) : super(key: key);

  @override
  _InitializerState createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  FirebaseAuth? _auth;
  User? _user;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth!.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ))
        : _user == null
            ? AnimatedSplash()
            : Fingerprint();
  }
}
