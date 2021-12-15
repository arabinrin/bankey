
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Button extends StatelessWidget {
  String? title;
  Color? color;
  Button({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: color,
        ),
        child: Center(
          child: Text(
            title.toString(),
            style: GoogleFonts.dmSans(
              textStyle:  TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      
    );
  }
}
