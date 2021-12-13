import 'package:bankey/model/account.dart';
import 'package:bankey/model/transaction.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/widgets/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Insight extends StatefulWidget {
  const Insight({Key? key}) : super(key: key);

  @override
  _InsightState createState() => _InsightState();
}

class _InsightState extends State<Insight> {
  final formatCurrency = new NumberFormat.simpleCurrency(decimalDigits: 0);
  final List<Color> gradientColors = [
    const Color(0xFF5E52D2),
    const Color(0xFFB697F9),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteback,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      )),
                  Text(
                    'Set Budget',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kprimarycolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Guy your balance is ${formatCurrency.format(accountModel[0].balance)} o',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: kBlack,
                  ),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Last month, you spent ${formatCurrency.format(accountModel[0].previous)} ',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 300,
              width: width,
              child: Stack(
                children: [
                  Container(
                    height: 320,
                  ),
                  Container(
                    height: 180,
                    width: width,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 11,
                        minY: 0,
                        maxY: 6,
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(show: false),
                        gridData: FlGridData(
                          show: false,
                        ),
                        lineBarsData: [
                          const LineChartBarData(
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [Color(0xFF697596)],
                            ),
                            isCurved: true,
                            show: true,
                            colors: [Color(0xFF697596)],
                            spots: [
                              FlSpot(0, 2.4),
                              FlSpot(2.6, 2.7),
                              FlSpot(4, 3.2),
                              FlSpot(5, 3),
                              FlSpot(6, 3.6),
                              FlSpot(7, 4.4),
                              FlSpot(9, 4.6),
                              FlSpot(11, 5.7),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: width,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 14,
                        minY: 0,
                        maxY: 6,
                        borderData: FlBorderData(
                            show: true,
                            border: Border(
                                right:
                                    BorderSide(color: Colors.white, width: 3))),
                        titlesData: FlTitlesData(show: false),
                        gridData: FlGridData(
                          show: false,
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              gradientColorStops: [6, 9],
                              colors: gradientColors
                                  .map((color) => color.withOpacity(.4))
                                  .toList(),
                            ),
                            isCurved: true,
                            show: true,
                            colors: [kprimarycolor.withOpacity(.9)],
                            spots: [
                              FlSpot(0, 2.5),
                              FlSpot(2.6, 3.2),
                              FlSpot(4, 2.8),
                              FlSpot(5, 3),
                              FlSpot(6, 3.8),
                              FlSpot(7, 4.8),
                              FlSpot(9, 4.5),
                              FlSpot(11, 5.8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: width * .1,
                    child: Container(
                      height: 110,
                      width: width * .8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Row(
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
                                      color: Color(0xFF1C1939).withOpacity(.8),
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
                                      color: Color(0xFF1C1939).withOpacity(.8),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                  child: Text(
                    'Top Transaction',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                      ),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 290,
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, i) => Divider(
                  thickness: 1,
                  color: Color(0xFFD2D1D7).withOpacity(.8),
                ),
                itemCount: tansactionModel.length,
                itemBuilder: (BuildContext context, int i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                tansactionModel[i].img,
                                height: 28,
                                width: 28,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    tansactionModel[i].name,
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
                                  '${tansactionModel[i].count} transactions',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(.7),
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${formatCurrency.format(tansactionModel[i].amount)}',
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: kBlack,
                              ),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          
            CategoryTile(),
          ],
        ),
      ),
    );
  }
}
