import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Splash extends StatelessWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      height: 450.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bankey',
            style: GoogleFonts.dmSans(
              textStyle:  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 70.sp,
                letterSpacing: -2,
              ),
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          Text(
            'Your friendly bank',
            style: GoogleFonts.dmSans(
              textStyle:  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20.sp,
              ),
            ),
          ),
           SizedBox(
            height: 10.h,
          ),
  
          Image.asset(
            'images/bro.png',
            height: 240.h,
            width: 245.w,
            // color: kGreen,
          )
        ],
      ),
    );
  }
}
