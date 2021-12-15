import 'package:bankey/model/budget_item.dart';
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ExpensesListView extends StatelessWidget {
  const ExpensesListView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, index) => const Divider(),
        itemCount: budgetItem.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            padding: const EdgeInsets.all(12),
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          budgetItem[index].img,
                          height: 30.h,
                          width: 30.w,
                          // color: kGreen,
                        ),
                         SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          budgetItem[index].item,
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: kBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$${budgetItem[index].point}',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        '${budgetItem[index].transactions} transactions',
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: kBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Container(
                            height: 10.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10.r),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: LinearPercentIndicator(
                          backgroundColor: Colors.grey.withOpacity(0),
                          width: width * .5,
                          animation: true,
                          lineHeight: 10.0,
                          animationDuration: 2500,
                          percent: budgetItem[index].point /
                              budgetItem[index].target,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: kprimarycolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
