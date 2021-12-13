import 'package:flutter/material.dart';

class BudgetModel {
  double price;
  String month;

  BudgetModel({required this.price, required this.month});
}

List<BudgetModel> budgetList = [
  BudgetModel(price: 125, month: 'This Month'),
  BudgetModel(price: 205, month: 'January'),
  BudgetModel(price: 141, month: 'February'),
  BudgetModel(price: 192, month: 'March'),
  BudgetModel(price: 100, month: 'April'),
  BudgetModel(price: 210, month: 'May'),
  BudgetModel(price: 115, month: 'June'),
];
