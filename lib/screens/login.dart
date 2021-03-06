import 'package:bankey/provider/user.dart';
import 'package:bankey/screens/signup.dart';
import 'package:bankey/screens/summary.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.h,
            ),
            Text(
              'Welcome Back!',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Sign in to continue',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.8),
                  letterSpacing: .4,
                ),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(
              height: 50.h,
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedInputField(
                    controller: authProvider.email,
                    icon: Icons.email_outlined,
                    hintText: 'Email Address',
                  ),
                  RoundedInputField(
                    controller: authProvider.password,
                    icon: Icons.lock,
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
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
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signIn()) {
                          _key.currentState?.showSnackBar(
                            SnackBar(
                              content: Text('Login fails'),
                            ),
                          );
                          return;
                        }
                        authProvider.cleanController();
                        changeScreenReplacement(context, Summary());
                      },
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kprimarycolor,
                        ),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          changeScreen(context, const SignUp());
                        },
                        child: Text(
                          ' - Sign Up',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: 15.sp,
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
