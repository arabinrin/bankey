import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransferModel {
  String name;
  String img;

  TransferModel({required this.name, required this.img});
}

List<TransferModel> transferModel = [
  TransferModel(
    name: 'Mobile',
    img: 'images/whiteuser.png',
  ),
  TransferModel(
    name: 'Bank',
    img: 'images/bank.png',
  ),
  TransferModel(
    name: 'Online',
    img: 'images/wireless-symbol.png',
  ),
  TransferModel(
    name: 'QR code',
    img: 'images/qr-code.png',
  ),
];
