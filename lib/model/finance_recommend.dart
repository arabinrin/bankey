import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecommendModel {
  int count;
  double amount;
  String recommedation;
  String category;

  RecommendModel(
      {required this.count,
      required this.amount,
      required this.recommedation,
      required this.category});
}

List<RecommendModel> recommendModel = [
  RecommendModel(
      count: 17,
      amount: 667,
      recommedation:
          'You spent 468 on food. That’s 50% higher than the average of our users.',
      category: 'Spending'),
  RecommendModel(
      count: 8,
      amount: 900,
      recommedation:
          'You were late to pay last month’s card bills. Lets try to be on time this month.',
      category: 'Credit'),
  RecommendModel(
      count: 6,
      amount: 100,
      recommedation:
          'Try to kala o, you don dey do too much trnasfer o. I think you should block Sandra',
      category: 'Transfer'),
];
