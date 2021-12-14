import 'package:flutter/material.dart';

class CategoryModel {
  int price;
  String item;
  String img;
  int target;

  CategoryModel(
      {required this.price,
      required this.item,
      required this.img,
      required this.target});
}

List<CategoryModel> categoryModel = [
  CategoryModel(
      price: 325, item: 'Housing ', img: 'images/house.png', target: 700),
  CategoryModel(
      price: 205,
      item: 'Lunch and Dinner',
      img: 'images/burger.png',
      target: 1000),
  CategoryModel(price: 241, item: 'Fuel', img: 'images/fuel.png', target: 400),
];
