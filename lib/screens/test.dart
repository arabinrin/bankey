// @dart=2.9

import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Pie extends StatefulWidget {
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {
  final formatCurrency =  NumberFormat.simpleCurrency(decimalDigits: 0);

  List<charts.Series<PieData, String>> _pieData;
  @override
  void initState() {
    super.initState();
    _pieData = List<charts.Series<PieData, String>>();
  }

  generateData() {
    var piedata = [
      new PieData('Lunch', 35.8),
      new PieData('Medicals', 8.3),
      new PieData('Car fuel', 10.8),
      new PieData('House rent', 15.6),
      new PieData('electricity', 19.2),
      new PieData('Week Hook up', 10.3),
    ];
    _pieData.add(
      charts.Series(
        domainFn: (PieData data, _) => data.activity,
        measureFn: (PieData data, _) => data.time,
        id: 'Time spent',
        data: piedata,
        labelAccessorFn: (PieData row, _) => '${row.activity}',
      ),
    );
    return _pieData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Center(
              child:  Text(
                    formatCurrency.format(1753),
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                    ),
                  ),
            ),
          ),
          Container(
            child: charts.PieChart(
              generateData(),
              animate: true,
              animationDuration: const Duration(seconds: 5),
              defaultRenderer: charts.ArcRendererConfig(
                arcWidth: 60,
                arcRendererDecorators: [
                  charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.inside)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PieData {
  String activity;
  double time;
  PieData(this.activity, this.time);
}
