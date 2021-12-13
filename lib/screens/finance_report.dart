import 'package:bankey/model/finance_recommend.dart';
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinancialReport extends StatefulWidget {
  const FinancialReport({Key? key}) : super(key: key);

  @override
  _FinancialReportState createState() => _FinancialReportState();
}

class _FinancialReportState extends State<FinancialReport> {
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
              height: height * .4,
              width: width,
              decoration: BoxDecoration(
                // image: const DecorationImage(
                //   image: AssetImage(
                //     'images/finscore.png',
                //   ),
                //   fit: BoxFit.contain,
                // ),
                color: kprimarycolor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'images/finscore.png',
                      height: 230,
                      width: 260,
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 50, horizontal: 10),
                          child: Text(
                            'Financial Score',
                            style: GoogleFonts.dmSans(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: .4,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'It can be better!',
                                style: GoogleFonts.dmSans(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: .4,
                                  ),
                                ),
                              ),
                              Text(
                                'Below are some recommendtions',
                                style: GoogleFonts.dmSans(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    'Recommedation',
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                        letterSpacing: .4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, i) => Divider(
                  color: Colors.transparent,
                ),
                itemCount: recommendModel.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin:const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: kprimarycolor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '+${recommendModel[i].count}',
                                style: GoogleFonts.dmSans(
                                  textStyle:const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width * .6,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recommendModel[i].category,
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    recommendModel[i].recommedation,
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: kBlack,
                                      ),
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                Text(
                                  'More details',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: kprimarycolor,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
