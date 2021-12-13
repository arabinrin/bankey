import 'package:bankey/screens/signup.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Text(
              'Welcome Back!',
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Sign in to continue',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.8),
                  letterSpacing: .4,
                ),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RoundedInputField(
                    icon: Icons.email_outlined,
                    hintText: 'Email Address',
                  ),
                  const RoundedInputField(
                    icon: Icons.lock,
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 200),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FadeTransition(
                                      opacity: animation, child: Login()),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kprimarycolor,
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.dmSans(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          changeScreen(context,const SignUp());
                        },
                        child: Text(
                          ' - Sign Up',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
