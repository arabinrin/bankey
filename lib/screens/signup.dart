import 'package:bankey/screens/login.dart';
import 'package:bankey/screens/number_sign_up.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/button.dart';
import 'package:bankey/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Text(
                'Welcome!',
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
                'Please provide following \n details for your new account',
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
                      hintText: 'Full Name',
                    ),
                    const RoundedInputField(
                      icon: Icons.email_outlined,
                      hintText: 'Email Address',
                    ),
                    const RoundedInputField(
                      icon: Icons.lock,
                      hintText: 'Password',
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
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
                              fontSize: 15,
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
                      onTap: () {
                        changeScreen(context, Login());
                      },
                      child: Button(title: 'Sign up', color: kprimarycolor),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                     GestureDetector(
                      onTap: () {
                        changeScreen(context, NumberLog());
                      },
                      child:Button(
                      title: 'Sign up with Phone Number',
                      color: kBlack,
                    ),),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.dmSans(
                            textStyle: const TextStyle(
                              fontSize: 15,
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
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        FadeTransition(
                                            opacity: animation, child: Login()),
                              ),
                            );
                          },
                          child: Text(
                            ' - Login',
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
      ),
    );
  }
}
