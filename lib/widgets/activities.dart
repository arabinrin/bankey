import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ActivityCard extends StatelessWidget {
  final String img;
  final String name;
  ActivityCard({required this.img, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      margin:const EdgeInsets.all(5),
      height: 120,
      width: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 3,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: kprimarycolor, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Image.asset(img,height: 20,width: 20,),
            ),
          ),
        const  SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: GoogleFonts.dmSans(
              textStyle:const TextStyle(
                fontSize: 15,
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
