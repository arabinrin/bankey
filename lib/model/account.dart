import 'package:flutter/material.dart';

class AccountModel {
  double earned;
  double spent;
  String img;
  int stage;

  AccountModel(
      {required this.earned,
      required this.spent,
      required this.img,
      required this.stage});
}

List<AccountModel> accountModel = [
  AccountModel(
      earned: 1460, spent: 2730, img: 'images/Profile Image.png', stage: 7)
];
