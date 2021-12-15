import 'dart:async';

import 'package:bankey/screens/fingerprint.dart';
import 'package:bankey/screens/number_sign_up.dart';
import 'package:bankey/screens/test.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/button.dart';
import 'package:bankey/widgets/category.dart';
import 'package:bankey/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final formatCurrency =  NumberFormat.simpleCurrency(decimalDigits: 0);

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
      final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
               SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.menu_rounded),
                  ),
                  Text(
                    'Summary',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                       
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
               SizedBox(
                height: 20.h,
              ),
              Image.asset(
                'images/summary.png',
                height: 190.h,
                width: 235.w,
                // color: kGreen,
              ),
               SizedBox(
                height: 20.h,
              ),
              Text(
                'This month’s spending',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kBlack,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                formatCurrency.format(1753),
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: kBlack,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Well done, you have maintained your \n spending.',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1C1939).withOpacity(.8),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
               SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  print('width: ${width} \n height: ${height}');
                  // changeScreen(context, Pie());
                },
                child: Button(title: 'Great', color: kprimarycolor),
              ),
               SizedBox(
                height: 15.h,
              ),
              Container(
                color: const Color(0xFFF9F9FB),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Top Category',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: kBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    const CategoryTile(),
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
