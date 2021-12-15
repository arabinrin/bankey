import 'package:bankey/model/budget_item.dart';
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BudgetListView extends StatelessWidget {
  const BudgetListView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, index) => Divider(
              height: 10.h,
            ),
        itemCount: budgetItem.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            padding:const EdgeInsets.all(12),
            height: 200.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/burger.png',
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
                      '\$${budgetItem[index].daily}/day',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: LinearPercentIndicator(
                          backgroundColor:
                              Colors.grey.withOpacity(0),
                          width: width * .5,
                          animation: true,
                          lineHeight: 40.0.h,
                          animationDuration: 2500,
                          percent: budgetItem[index].point /
                              budgetItem[index].target,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: kprimarycolor,
                          center: Text(
                            '${budgetItem[index].point}',
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                                width: 2.0.w, color: kprimarycolor),
                          ),
                        ),
                        height: 60.h,
                        width: 100.w,
                        child: Center(
                          child: Text(
                            '\$${budgetItem[index].target}',
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color:
                                    kprimarycolor.withOpacity(.7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.h,),
              const  Divider(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your ${budgetItem[index].item} spending is still on track',
                        style: GoogleFonts.dmSans(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF9EA6BE),
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}