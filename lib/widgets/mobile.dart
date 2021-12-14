import 'package:bankey/model/contact.dart';
import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 160,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contactModel.length,
            itemBuilder: (_, i) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 165,
                width: 140,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: whiteback,
                        borderRadius: BorderRadius.circular(20),
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
                          fontSize: 13,
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
                            fontSize: 12,
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
          margin: EdgeInsets.symmetric(vertical: 10),
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
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                      ),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Container(
                height: 340,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, i) => Divider(),
                  itemCount: contactModel.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: whiteback,
                                  borderRadius: BorderRadius.circular(20),
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
                                        fontSize: 13,
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
                                          fontSize: 12,
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
                              height: 35,
                              width: 75,
                              decoration: BoxDecoration(
                                  color: Color(0xFF9EA6BE),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'invite',
                                  style: GoogleFonts.dmSans(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
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
