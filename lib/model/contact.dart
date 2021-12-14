import 'package:flutter/material.dart';

class ContactModel {
  String name;
  String img;
  String contact;
  bool registered;

  ContactModel(
      {required this.name,
      required this.img,
      required this.contact,
      required this.registered});
}

List<ContactModel> contactModel = [
  ContactModel(
    name: 'Hailey Sander',
    img: 'images/074.jpg',
    contact: '+090078601',
    registered: false,
  ),
  ContactModel(
    name: 'Zayn Michel',
    img: 'images/IMG_20201119_150951_430.jpg',
    contact: '+090078601',
    registered: false,
  ),
  ContactModel(
    name: 'Thomas Denver',
    img: 'images/denver.png',
    contact: '+090078601',
    registered: true,
  ),
  ContactModel(
    name: 'Adeosun samuel',
    img: 'images/1715.png',
    contact: '+090078601',
    registered: false,
  ),
];
