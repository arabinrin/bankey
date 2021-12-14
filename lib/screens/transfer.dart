import 'package:bankey/model/contact.dart';
import 'package:bankey/model/transfer.dart';
import 'package:bankey/utils/constant.dart';
import 'package:bankey/widgets/category.dart';
import 'package:bankey/widgets/mobile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteback,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                color: kprimarycolor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      'Transfer',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: .4,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                                      horizontal: 15, vertical: 10),
                                  height: 62,
                                  width: 62,
                                  decoration: BoxDecoration(
                                    color: (scrollIndex == i)
                                        ? Color(0xFF7C6EFF)
                                        : Color(0xFF665AD9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      transferModel[i].img,
                                      height: 18,
                                      width: 18,
                                      color: (scrollIndex == i)
                                          ? Colors.white
                                          : Colors.white.withOpacity(.5),
                                    ),
                                  ),
                                ),
                                Text(
                                  transferModel[i].name,
                                  style: GoogleFonts.dmSans(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
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

