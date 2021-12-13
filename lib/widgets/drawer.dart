import 'package:bankey/screens/budget.dart';
import 'package:bankey/screens/dashboard.dart';
import 'package:bankey/screens/finance_report.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/listtile.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
                onTap: () {
                  changeScreen(context, Budget());
                },
                child: ListTiling('images/house.png', 'Budget')),
            GestureDetector(
                onTap: () {
                  changeScreen(context, DashBoaard());
                },
                child: ListTiling('images/house.png', 'Dashboard')),
            GestureDetector(
                onTap: () {
                  changeScreen(context, FinancialReport());
                },
                child: ListTiling('images/house.png', 'FInancial Report')),
          ],
        ),
      ),
    );
  }
}
