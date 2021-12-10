import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bankey',
            style: GoogleFonts.dmSans(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 70,
                letterSpacing: -2,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Your friendly bank',
            style: GoogleFonts.dmSans(
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
  
          Image.asset(
            'images/bro.png',
            height: 240,
            width: 245,
            // color: kGreen,
          )
        ],
      ),
    );
  }
}
