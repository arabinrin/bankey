import 'package:flutter/material.dart';

class CategoryModel {
  int price;
  String item;
  String img;

  CategoryModel({required this.price, required this.item,required this.img});
}

List<CategoryModel> categoryModel = [
  CategoryModel(price: 325, item: 'Housing ',img:'images/house.png' ),
  CategoryModel(price: 205, item: 'Lunch and Dinner',img:'images/burger.png' ),
  CategoryModel(price: 241, item: 'Fuel',img: 'images/fuel.png',),

];
