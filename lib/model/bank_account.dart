import 'package:flutter/material.dart';

class BankAccountModel with ChangeNotifier {
  String bank;
  double balance;
  double cardNumber;
  String img;
  String category;
  bool isFavorite;

  BankAccountModel(
      {required this.bank,
      required this.img,
      required this.cardNumber,
      required this.balance,
      required this.category,
      this.isFavorite = false});
  toggleFavoriteStatus() {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
  }
}
