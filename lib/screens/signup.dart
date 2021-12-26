import 'package:bankey/provider/user.dart';
import 'package:bankey/screens/login.dart';
import 'package:bankey/screens/number_sign_up.dart';
import 'package:bankey/screens/summary.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/loading.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/button.dart';
import 'package:bankey/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

bool isLogin = false;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    final _key = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.h,
                    ),
                    Text(
                      'Welcome!',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                    Text(
                      'Please provide following \n details for your new account',
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
                            controller: authProvider.name,
                            hintText: 'Full Name',
                          ),
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
                          Row(
                            children: [
                              Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: kprimarycolor),
                                  color: kLightPrimary.withOpacity(.2),
                                ),
                                child: Checkbox(
                                  // fillColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  value: true,
                                  onChanged: null,
                                  checkColor: kprimarycolor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'By creating your account you agree with   to \n our Terms and Conditions.',
                                style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(.8),
                                    letterSpacing: .4,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (!await authProvider.signUp()) {
                                _key.currentState?.showSnackBar(
                                  SnackBar(
                                    content: Text('Registration fails'),
                                  ),
                                );
                                return;
                              }
                              authProvider.cleanController();
                              changeScreenReplacement(context, Summary());
                            },
                            child:
                                Button(title: 'Sign up', color: kprimarycolor),
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeScreen(context, const NumberLog());
                            },
                            child: Button(
                              title: 'Sign up with Phone Number',
                              color: kBlack,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 200),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                              opacity: animation,
                                              child: const Login()),
                                    ),
                                  );
                                },
                                child: Text(
                                  ' - Login',
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
            ),
    );
  }
}
