import 'package:bankey/model/contact.dart';
import 'package:bankey/model/transfer.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/widgets/category.dart';
import 'package:bankey/widgets/mobile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  List<Widget> body = [
    Mobile(),
    CategoryTile(),
    Mobile(),
    CategoryTile(),
  ];

 int scrollIndex=0;

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
              width: width,
              decoration: BoxDecoration(
                color: kprimarycolor,
                borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 40.h),
                    child: Text(
                      'Transfer',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: .4,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 120.h,
                    padding:  EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 10.h),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: transferModel.length,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                scrollIndex = i;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.h),
                                  height: 62.h,
                                  width: 62.w,
                                  decoration: BoxDecoration(
                                    color: (scrollIndex == i)
                                        ? Color(0xFF7C6EFF)
                                        : Color(0xFF665AD9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      transferModel[i].img,
                                      height: 18.h,
                                      width: 18.w,
                                      color: (scrollIndex == i)
                                          ? Colors.white
                                          : Colors.white.withOpacity(.5),
                                    ),
                                  ),
                                ),
                                Text(
                                  transferModel[i].name,
                                  style: GoogleFonts.dmSans(
                                    textStyle:  TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              child:body[scrollIndex],
            ),
          ],
        ),
      ),
    );
  }
}

