import 'package:bankey/model/bank_account.dart';
import 'package:bankey/provider/bank_account.dart';
import 'package:bankey/utils/constant.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountCard extends StatefulWidget {
  final BankAccountModel bankAccountModel;
  AccountCard(this.bankAccountModel);

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final bankAccount = Provider.of<BankAccountModels>(context, listen: false);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: whiteback,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Text(
                  widget.bankAccountModel.category,
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
              color: Colors.white, borderRadius: BorderRadius.circular(21.r)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Color(0xFFF7911E),
                        image: DecorationImage(
                          image: AssetImage(
                            widget.bankAccountModel.img,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: Text(
                            widget.bankAccountModel.bank,
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Checking. ${widget.bankAccountModel.cardNumber}',
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
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${formatCurrency.format(widget.bankAccountModel.balance)}',
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
                    value: widget.bankAccountModel.isFavorite,
                    onChanged: (value) {
                      bankAccount.setFavValue(widget.bankAccountModel);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
