import 'package:bankey/screens/insight.dart';
import 'package:bankey/screens/passcode.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/activities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashBoaard extends StatefulWidget {
  const DashBoaard({Key? key}) : super(key: key);

  @override
  _DashBoaardState createState() => _DashBoaardState();
}

class _DashBoaardState extends State<DashBoaard> {
  final formatCurrency = new NumberFormat.simpleCurrency(decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                    padding: EdgeInsets.all(20),
                    height: height * .35,
                    color: kprimarycolor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                    formatCurrency.format(7425),
                                    style: GoogleFonts.dmSans(
                                      textStyle: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Available balance',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color(0xFFFFFFFF).withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
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
                      height: 220,
                      width: width * .8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color(0xFF1C1939).withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            formatCurrency.format(1460),
                                            style: GoogleFonts.dmSans(
                                              textStyle: TextStyle(
                                                fontSize: 24,
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
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color(0xFF1C1939).withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(children: [
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF967AF3),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        formatCurrency.format(2730),
                                        style: GoogleFonts.dmSans(
                                          textStyle: TextStyle(
                                            fontSize: 24,
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
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'You spent 2,732 on dining out this month. This is 25% more than last month.',
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1C1939).withOpacity(.8),
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tell me more',
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: kprimarycolor,
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
              height: 20,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlack,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ActivityCard(
                        img: 'images/send.png',
                        name: 'Transfer',
                      ),
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
                          changeScreen(context, Insight());
                        },
                        child: ActivityCard(
                          img: 'images/growth.png',
                          name: 'Insight',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Complete Verification',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlack,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 370,
                    width: width * .8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 5,
                          spreadRadius: 5,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
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
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  '7 of 10 completed',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF1C1939).withOpacity(.8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: LinearPercentIndicator(
                                backgroundColor: Colors.grey.withOpacity(.5),
                                width: width * .6,
                                animation: true,
                                lineHeight: 12.0,
                                animationDuration: 2500,
                                percent: .74,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: kprimarycolor,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'images/user.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal Information',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      'Please provide documents to verify your  \n source of income personal informmation.',
                                      style: GoogleFonts.dmSans(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color(0xFF1C1939).withOpacity(.8),
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
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: kprimarycolor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'images/identity-card.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Text(
                              'Complete Verification',
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
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'images/email.png',
                                height: 20,
                                width: 20,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'News and promo',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlack,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 320,
                    width: width * .8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 5,
                          spreadRadius: 5,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset('images/Charachter add.png'),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Invite your friends!',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 16,
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1C1939).withOpacity(.8),
                                  ),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  'Invite Now',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 13,
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
