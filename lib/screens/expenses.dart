import 'package:bankey/screens/test.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/widgets/expenses_listview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height.h;
    final width = MediaQuery.of(context).size.width.w;
    return Scaffold(
      backgroundColor: whiteback,
      body: SingleChildScrollView(
        child: Column(children: [
           SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Budget',
                  style: GoogleFonts.dmSans(
                    textStyle:  TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: kBlack,
                      letterSpacing: .4,
                    ),
                  ),
                ),
                 SizedBox(
                  width: 20.w,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              height: 300..h,
              width: 300.w,
              child: Pie()),
          Container(
            width: width * .8,
            height: height * .6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: const Color(0xFFF9F9FB),
            ),
            child: ExpensesListView(width: width),
          ),
        ]),
      ),
    );
  }
}
