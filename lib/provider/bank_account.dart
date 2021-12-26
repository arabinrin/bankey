import 'package:bankey/model/bank_account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BankAccountModels with ChangeNotifier {
  List<BankAccountModel> _bankAccountModel = [
    BankAccountModel(
        bank: 'Bank West',
        img: 'images/bankwest.png',
        cardNumber: 11065,
        balance: 29590,
        category: 'Bank Account'),
    BankAccountModel(
        bank: 'Master Card',
        img: 'images/mastercard.png',
        cardNumber: 435753891209,
        balance: 27358,
        category: 'Card'),
    BankAccountModel(
        bank: 'Online Payment',
        img: 'images/paypal.png',
        cardNumber: 11065,
        balance: 29590,
        category: 'Online Payment'),
  ];
  List<BankAccountModel> get bankAccountModel {
    return [..._bankAccountModel];
  }

  void setFavValue( BankAccountModel account) {
    account.isFavorite = !account.isFavorite;
    notifyListeners();
  }


}
