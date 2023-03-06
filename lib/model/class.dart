// model
import 'dart:ffi';

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

class Cart extends Fruit {
  String? id;
  int? quantity;
  Cart({this.quantity}) : super();
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

  Oder(
      {this.idOder,
      this.nameOder,
      this.money,
      this.statusOder,
      this.image,
      this.quantity,this.expected});

  Map<String, dynamic> toJson() => {
        'idOder': idOder,
        'nameOder': nameOder,
        'statusOder': statusOder,
        'money': money,
        'detailOder': detailOder,
        'image': image,
        'quantity': quantity,
        'expected':expected
      };
}
