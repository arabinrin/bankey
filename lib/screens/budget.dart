import 'package:bankey/model/budget.dart';
import 'package:bankey/model/budget_item.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/widgets/budget_listview.dart';
import 'package:bankey/widgets/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
  final formatCurrency =  NumberFormat.simpleCurrency(decimalDigits: 0);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    int _current = 0;

    return Scaffold(
      key: _scaffoldKey,
      drawer:const DrawerWidget(),
      backgroundColor:const Color(0xFFF9F9FB),
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: height * .4,
                width: width,
                decoration: BoxDecoration(
                  color: kprimarycolor,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(width, 100.0)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Budget',
                            style: GoogleFonts.dmSans(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: .4,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider.builder(
                      itemCount: budgetList.length,
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: 110,
                        reverse: true,
                        viewportFraction: .55,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        //    onPageChanged: (index, reasom) =>
                        //       setState(() => _current = index),
                      ),
                      itemBuilder: (_, index, o) {
                        return Container(
                          padding:
                          const    EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          width: 180,
                          child: Column(
                            children: [
                              Text(
                                formatCurrency.format(budgetList[index].price),
                                style: GoogleFonts.dmSans(
                                  textStyle: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                budgetList[index].month,
                                style: GoogleFonts.dmSans(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 250,
              right: width * .1,
              child: Container(
                width: width * .8,
                height: height * .6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF9F9FB),
                ),
                child: BudgetListView(width: width),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
