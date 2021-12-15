import 'package:bankey/screens/finance_report.dart';
import 'package:bankey/screens/insight.dart';
import 'package:bankey/screens/passcode.dart';
import 'package:bankey/screens/transfer.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/activities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DashBoaard extends StatefulWidget {
  const DashBoaard({Key? key}) : super(key: key);

  @override
  _DashBoaardState createState() => _DashBoaardState();
}

class _DashBoaardState extends State<DashBoaard> {
  final formatCurrency = new NumberFormat.simpleCurrency(decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height.h;
    final width = MediaQuery.of(context).size.width.w;

    return Scaffold(
      backgroundColor: whiteback,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * .5,
              child: Stack(
                children: [
                  Container(
                    padding:const EdgeInsets.all(20),
                    height: height * .35,
                    color: kprimarycolor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100.h,
                              child: Column(
                                children: [
                                  Text(
                                    formatCurrency.format(7425),
                                    style: GoogleFonts.dmSans(
                                      textStyle:  TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Available balance',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color:
                                         const   Color(0xFFFFFFFF).withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50.h,
                              width: 50.w,
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                image:const DecorationImage(
                                  image: AssetImage(
                                    'images/1715.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                color:kprimarycolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height * .25,
                    left: width * .1,
                    child: Container(
                      height: 220.h,
                      width: width * .8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding:
                        const    EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spent',
                                      style: GoogleFonts.dmSans(
                                        textStyle: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color(0xFF1C1939).withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 10.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            formatCurrency.format(1460),
                                            style: GoogleFonts.dmSans(
                                              textStyle: TextStyle(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.bold,
                                                color: kBlack,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Earned',
                                      style: GoogleFonts.dmSans(
                                        textStyle: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color(0xFF1C1939).withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(children: [
                                      Container(
                                        height: 10.h,
                                        width: 10.w,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF967AF3),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        formatCurrency.format(2730),
                                        style: GoogleFonts.dmSans(
                                          textStyle: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold,
                                            color: kBlack,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'You spent 2,732 on dining out this month. This is 25% more than last month.',
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1C1939).withOpacity(.8),
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                         const   SizedBox(
                              height: 5,
                            ),

                            InkWell(
                                onTap: () {
                          changeScreen(context, const FinancialReport());
                        },
                              child: Text(
                                'Tell me more',
                                style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kprimarycolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Activities',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: kBlack,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                        InkWell(
                        onTap: () {
                          changeScreen(context,const Transfer());
                        },
                        child:ActivityCard(
                        img: 'images/send.png',
                        name: 'Transfer',
                      ),),
                      InkWell(
                         onTap: () {
                          changeScreen(context, DemoPage());
                        },
                        child: ActivityCard(
                          img: 'images/credit.png',
                          name: 'My Card',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeScreen(context,const Insight());
                        },
                        child: ActivityCard(
                          img: 'images/growth.png',
                          name: 'Insight',
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Complete Verification',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: kBlack,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding:const EdgeInsets.all(20),
                    height: 370.h,
                    width: width * .8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 5.r,
                          spreadRadius: 5.r,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '75%',
                                  style: GoogleFonts.dmSans(
                                    textStyle:  TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  '7 of 10 completed',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color:const Color(0xFF1C1939).withOpacity(.8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:const EdgeInsets.all(10),
                              child: LinearPercentIndicator(
                                backgroundColor: Colors.grey.withOpacity(.5),
                                width: width * .6,
                                animation: true,
                                lineHeight: 12.0.h,
                                animationDuration: 2500,
                                percent: .74,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: kprimarycolor,
                              ),
                            ),
                          ],
                        ),
                       const Divider(),
                         SizedBox(
                          height: 10.h,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'images/user.png',
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal Information',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                   SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    child: Text(
                                      'Please provide documents to verify your  \n source of income personal informmation.',
                                      style: GoogleFonts.dmSans(
                                        textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                            const  Color(0xFF1C1939).withOpacity(.8),
                                        ),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Text(
                                    'Continue',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kprimarycolor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                         SizedBox(
                          height: 10.h,
                        ),
                        Divider(),
                         SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'images/identity-card.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ),
                            Text(
                              'Complete Verification',
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kBlack,
                                ),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                         SizedBox(
                          height: 10.h,
                        ),
                      const  Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'images/email.png',
                                height: 20.h,
                                width: 20.w,
                              ),
                            ),
                            Text(
                              'Confirm email',
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: kBlack,
                                ),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'News and promo',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: kBlack,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 320.h,
                    width: width * .8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 5.r,
                          spreadRadius: 5.r,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Image.asset('images/Charachter add.png'),
                        Padding(
                          padding:const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                     EdgeInsets.symmetric(vertical: 10.h),
                                child: Text(
                                  'Invite your friends!',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlack,
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Text(
                                'For every user you invite and signs up, you can earn up \$5.',
                                style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color:const Color(0xFF1C1939).withOpacity(.8),
                                  ),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding:
                                     EdgeInsets.symmetric(vertical: 20.h),
                                child: Text(
                                  'Invite Now',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kprimarycolor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
