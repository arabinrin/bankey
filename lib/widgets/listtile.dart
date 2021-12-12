import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ListTiling extends StatelessWidget {
  String image;
  String text;
  ListTiling(this.image, this.text);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageIcon(
        AssetImage(image),
        size: 25,
        color: Colors.white
      ),
      title: Text(text,style: GoogleFonts.dmSans( textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),

      ),),
    );
  }
}
