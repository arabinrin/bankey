import 'package:bankey/utils/constant.dart';
import 'package:bankey/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Verify extends StatefulWidget {
  @override
  State<Verify> createState() => _VerifyState();
}
final TextEditingController otpController = TextEditingController();

class _VerifyState extends State<Verify> {
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
                'Verify Account!',
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
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Enter 4-digit Code code we have sent to at',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(.8),
                          letterSpacing: .4,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' \n +0 000 000 0000',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kprimarycolor,
                          letterSpacing: .4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width * 8,
                fieldWidth: 60,
                style: GoogleFonts.dmSans(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Didn’t  received the code?',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.8),
                    letterSpacing: .4,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Resend Code',
                style: GoogleFonts.dmSans(
                  decoration: TextDecoration.underline,
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kprimarycolor,
                    letterSpacing: .4,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
              onTap:  (){
                
              },
                child: Button(
                  title: 'Proceed',
                 
                  color: kprimarycolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'By clicking start, you agree to our',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(.8),
                        letterSpacing: .4,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' Privacy Policy',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kprimarycolor,
                        letterSpacing: .4,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' and',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(.8),
                        letterSpacing: .4,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: ' Teams and Conditions',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kprimarycolor,
                        letterSpacing: .4,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
