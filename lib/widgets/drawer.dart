import 'package:bankey/screens/budget.dart';
import 'package:bankey/screens/dashboard.dart';
import 'package:bankey/screens/expenses.dart';
import 'package:bankey/screens/finance_report.dart';
import 'package:bankey/screens/insight.dart';
import 'package:bankey/screens/transfer.dart';
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
          borderRadius: const BorderRadius.only(
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
                  changeScreen(context, const Budget());
                },
                child: ListTiling('images/house.png', 'Budget')),
            GestureDetector(
                onTap: () {
                  changeScreen(context, const DashBoaard());
                },
                child: ListTiling('images/house.png', 'Dashboard')),
            GestureDetector(
                onTap: () {
                  changeScreen(context, const FinancialReport());
                },
                child: ListTiling('images/house.png', 'FInancial Report')),
            GestureDetector(
                onTap: () {
                  changeScreen(context, const Expenses());
                },
                child: ListTiling('images/house.png', 'Expemses')),
            GestureDetector(
                onTap: () {
                  changeScreen(context, const Insight());
                },
                child: ListTiling('images/house.png', 'Insight')),
            GestureDetector(
                onTap: () {
                  changeScreen(context, const Transfer());
                },
                child: ListTiling('images/house.png', 'Transfer')),
          ],
        ),
      ),
    );
  }
}
