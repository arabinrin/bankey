import 'package:bankey/model/contact.dart';
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mobile extends StatelessWidget {
  const Mobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                'Recent',
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
        ),
        Container(
          height: 160.h,
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contactModel.length,
            itemBuilder: (_, i) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 165.h,
                width: 140.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: whiteback,
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          image: AssetImage(
                            contactModel[i].img,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      contactModel[i].name,
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: kBlack,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        contactModel[i].contact,
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF9EA6BE),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'All Contacts',
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
              Container(
                height: 340.h,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, i) => Divider(),
                  itemCount: contactModel.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60.h,
                                width: 60.w,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: whiteback,
                                  borderRadius: BorderRadius.circular(20.r),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      contactModel[i].img,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    contactModel[i].name,
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      contactModel[i].contact,
                                      style: GoogleFonts.dmSans(
                                        textStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF9EA6BE),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 35.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                  color: Color(0xFF9EA6BE),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'invite',
                                  style: GoogleFonts.dmSans(
                                    textStyle:  TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
