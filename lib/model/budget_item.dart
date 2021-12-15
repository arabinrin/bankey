import 'package:flutter/material.dart';

class BudgetItemModel {
  double target;
  double point;
  String item;
  double daily;
  int transactions;
  String img;

  BudgetItemModel(
      {required this.target,
      required this.point,
      required this.img,
      required this.item,
      required this.transactions,
      required this.daily});
}

List<BudgetItemModel> budgetItem = [
  BudgetItemModel(
      img: 'images/burger.png',
      target: 900,
      point: 450,
      item: 'Lunch and Dinner',
      daily: 52,
      transactions: 3),
  BudgetItemModel(
      img: 'images/fuel.png',
      target: 900,
      point: 700,
      item: 'Car fuel',
      daily: 20,
      transactions: 4),
  BudgetItemModel(
      img: 'images/medical.png',
      target: 900,
      point: 530,
      item: 'Medical allowance',
      daily: 30,
      transactions: 3),
];
