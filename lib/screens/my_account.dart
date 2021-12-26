import 'package:bankey/helper/controller.dart';
import 'package:bankey/model/account.dart';
import 'package:bankey/model/bank_account.dart';
import 'package:bankey/provider/bank_account.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/widgets/bank_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_switch/custom_switch.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

class _AccountState extends State<Account> {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final bankAccount = Provider.of<BankAccountModels>(context, listen: false);
    final bank = bankAccount.bankAccountModel;
    return Scaffold(
      backgroundColor: whiteback,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Text(
                          'My Account',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: kBlack,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: whiteback,
                          ),
                          child: Center(
                            child: Image.asset(
                              'images/account.png',
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Link new account',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w700,
                              color: kprimarycolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: height * .8,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (BuildContext context, index) => Divider(
                        height: 10.h,
                      ),
                  itemCount: bank.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: whiteback,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 20.w),
                                child: Text(
                                  bank[i].category,
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          padding: EdgeInsets.all(10),
                          height: 200.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(21.r)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: Color(0xFFF7911E),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                bankAccount
                                                    .bankAccountModel[i].img,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 10.w),
                                              child: Text(
                                                bank[i].bank,
                                                style: GoogleFonts.dmSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Checking. ${bank[i].cardNumber}',
                                              style: GoogleFonts.dmSans(
                                                textStyle: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_horiz)),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Available balance',
                                          style: GoogleFonts.dmSans(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          '${formatCurrency.format(bank[i].balance)}',
                                          style: GoogleFonts.dmSans(
                                            textStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomSwitch(
                                    activeColor: kprimarycolor,
                                    value: bank[i].isFavorite,
                                    onChanged: (value) {
                                      bankAccount.setFavValue(bank[i]);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
