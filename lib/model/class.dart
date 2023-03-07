// model
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Fruit {
  String? id;
  String? name;
  String? image;
  String? detail;
  String? price;
  Fruit({this.id, this.name, this.image, this.price, this.detail});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'detail': detail
      };
}

class Carts extends Fruit {
  String? id;
  int? quantity;
  String? name;
  String? image;
  String? detail;
  String? price;
  Carts(
      {this.id, this.quantity, this.name, this.price, this.detail, this.image});

  Carts.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot['id'],
        name = snapshot['name'],
        image = snapshot['image'],
        detail = snapshot['detail'],
        quantity = snapshot['quantity'],
        price = snapshot['price'];

  Carts.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        price = json['price'],
        detail = json['detail'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'detail': detail
      };
}

class Oder {
  String? idOder;
  String? nameOder;
  int? statusOder;
  double? money;
  String? image;
  String? detailOder;
  int? quantity;
  String? expected;
  DateTime? dateOder;

  Oder(
      {this.idOder,
      this.nameOder,
      this.money,
      this.statusOder,
      this.image,
      this.quantity,
      this.expected,this.dateOder,this.detailOder});

  Map<String, dynamic> toJson() => {
        'idOder': idOder,
        'nameOder': nameOder,
        'statusOder': statusOder,
        'money': money,
        'detailOder': detailOder,
        'image': image,
        'quantity': quantity,
        'expected': expected,
        'dateOder': dateOder
      };
}
