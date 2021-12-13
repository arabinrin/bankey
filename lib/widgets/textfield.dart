import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const RoundedInputField({
    required this.hintText,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        // onChanged: onChanged,
        cursorColor: kprimarycolor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.grey,
            size: 18,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
   TextFieldContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
