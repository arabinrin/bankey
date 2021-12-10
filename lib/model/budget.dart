import 'package:flutter/material.dart';

class BudgetModel {
  double price;
  String month;

  BudgetModel({required this.price, required this.month});
}

List<BudgetModel> budgetList = [
  BudgetModel(price: 115, month: 'This Month'),
  BudgetModel(price: 115, month: 'January'),
  BudgetModel(price: 115, month: 'February'),
  BudgetModel(price: 115, month: 'March'),
  BudgetModel(price: 115, month: 'April'),
  BudgetModel(price: 115, month: 'May'),
  BudgetModel(price: 115, month: 'June'),
];
