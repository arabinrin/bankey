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

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final formatCurrency =  NumberFormat.simpleCurrency();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:const DrawerWidget(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
            const  SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon:const Icon(Icons.menu_rounded),
                  ),
                  Text(
                    'Summary',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                        letterSpacing: .4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'images/summary.png',
                height: 190,
                width: 235,
                // color: kGreen,
              ),
              const SizedBox(
                height: 20,
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
                    fontSize: 40,
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
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color:const Color(0xFF1C1939).withOpacity(.8),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, DeterminatePage());
                },
                child: Button(title: 'Great', color: kprimarycolor),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color:const Color(0xFFF9F9FB),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Top Category',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: kBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  const  CategoryTile(),
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
