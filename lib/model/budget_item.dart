import 'package:flutter/material.dart';

class BudgetItemModel {
  double target;
  double point;
  String item;
  double daily;

  BudgetItemModel(
      {required this.target,
      required this.point,
      required this.item,
      required this.daily});
}

List<BudgetItemModel> budgetItem = [
  BudgetItemModel(target: 900, point: 450, item: 'Lunch and Dinner', daily: 52),
  BudgetItemModel(target: 900, point: 200, item: 'Car fuel', daily: 20),
  BudgetItemModel(
      target: 900, point: 230, item: 'Medical allowance', daily: 30),
];
