import 'package:bankey/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  TextEditingController? controller;
  RoundedInputField({
    required this.controller,
    required this.hintText,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        // onChanged: onChanged,
        cursorColor: kprimarycolor,
        controller: controller,
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
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
