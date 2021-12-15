import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityCard extends StatelessWidget {
  final String img;
  final String name;
  ActivityCard({required this.img, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      margin:const EdgeInsets.all(5),
      height: 120.h,
      width: 110.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 3.r,
            spreadRadius: 5.r,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
                color: kprimarycolor, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Image.asset(img,height: 20.h,width: 20.w,),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            name,
            style: GoogleFonts.dmSans(
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
