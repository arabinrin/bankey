import 'package:bankey/screens/login.dart';
import 'package:bankey/screens/summary.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "images/Thumbs Up.png",
              height: 235,
              width: 260,
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Account Created!',
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  color: kBlack,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your account has been created successfully. \n Press continue to start using app.',
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
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                changeScreenReplacement(context, Summary());
              },
              child: Button(
                title: 'Continue',
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
    );
  }
}
