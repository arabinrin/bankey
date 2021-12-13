import 'package:flutter/material.dart';

class AccountModel {
  double earned;
  double spent;
  double balance;
  double previous;
  String img;
  int stage;

  AccountModel({
    required this.earned,
    required this.spent,
    required this.previous,
    required this.img,
    required this.stage,
    required this.balance,
  });
}

List<AccountModel> accountModel = [
  AccountModel(
      earned: 1460,
      spent: 2730,
      balance: 2756,
      previous: 2712,
      img: 'images/Profile Image.png',
      stage: 7)
];
