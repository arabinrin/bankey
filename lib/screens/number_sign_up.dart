import 'package:bankey/screens/created.dart';
import 'package:bankey/screens/verify_code.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/button.dart';
import 'package:bankey/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OPT_FORM_STATE,
}

class NumberLog extends StatefulWidget {
  const NumberLog({Key? key}) : super(key: key);

  @override
  _NumberLogState createState() => _NumberLogState();
}

class _NumberLogState extends State<NumberLog> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  String verificationId = '';
  String phone = '';
  String otp = '';

  void signInWithPhoneAuthCredential(phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              child: Create(),
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = true;
      });
      _scaffoldkey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  bool showLoading = false;
  getOtpWidget(BuildContext context) {
    return SingleChildScrollView(
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
                    text: 'Enter 6-digit Code code we have sent to ',
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
                    text: ' \n$phone',
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
              length: 6,
              width: MediaQuery.of(context).size.width * 8,
              fieldWidth: 40,
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
                print("Completed: " + pin);
                otp = pin;
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
            GestureDetector(
              onTap: () {
                changeScreenReplacement(context, NumberLog());
              },
              child: Text(
                'Resend Code',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kprimarycolor,
                    letterSpacing: .4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () async {
                final phoneAuthCredential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: otp);
                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kprimarycolor,
                ),
                child: Center(
                  child: Text(
                    'Proceed'.toString(),
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
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
    );
  }

  getMobileWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Text(
              'Mobile Number',
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
              'Please enter your phone number. We will send you 4-digit code to verify your account.',
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
              key: formKey,
              child: InternationalPhoneNumberInput(
                hintText: '+00 000 0000',
                onInputChanged: (PhoneNumber number) {
                  phone = number.phoneNumber;
                  print(" see ${phone}");
                },
                onInputValidated: (bool value) {},
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                // selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: phoneController,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                searchBoxDecoration:
                    InputDecoration(fillColor: Colors.grey.shade300),
                autoFocus: false,
                errorMessage: 'Invalid phone number',
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onSaved: (PhoneNumber number) {
                  print('On Saved: ${phoneController.text}');
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  showLoading = true;
                });
                await _auth.verifyPhoneNumber(
                  phoneNumber: phone,
                  verificationCompleted: (phoneAuthcredential) async {
                    setState(() {
                      showLoading = false;
                    });
                    // signInWithPhoneAuthCredential(AuthCredential);
                  },
                  verificationFailed: (verificationFailed) async {
                    _scaffoldkey.currentState!.showSnackBar(
                        SnackBar(content: Text(verificationFailed.message)));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showLoading = false;

                      currentState =
                          MobileVerificationState.SHOW_OPT_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     transitionDuration: const Duration(milliseconds: 500),
                    //     reverseTransitionDuration:
                    //         const Duration(milliseconds: 200),
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         FadeTransition(
                    //       opacity: animation,
                    //       child: Verify(),
                    //     ),
                    //   ),
                    // );
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {},
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
                    'Send Code'.toString(),
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      body: showLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
              ? getMobileWidget(context)
              : getOtpWidget(context),
    );
  }
}
