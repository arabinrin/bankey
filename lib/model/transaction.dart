import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TansactionModel {
  int count;
  double amount;
  String name;
  String img;

  TansactionModel(
      {required this.count,
      required this.amount,
      required this.name,
      required this.img});
}

List<TansactionModel> tansactionModel = [
TansactionModel(count: 3, amount: 180, name: "PizzaHut", img: 'images/Bitmap.png'),
TansactionModel(count: 4, amount: 200, name: "Amazon", img: 'images/amazon.png'),
TansactionModel(count: 2, amount: 125, name: "Subway", img: 'images/subway.png'),
];
