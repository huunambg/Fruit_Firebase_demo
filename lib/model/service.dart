import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_firebare_crud/model/class.dart';

class Service {
  Future addFruit(Fruit fruit) async {
    final docFruit = FirebaseFirestore.instance.collection('Fruits').doc();

    fruit.id = docFruit.id;
    await docFruit.set(fruit.toJson());
  }

   Future addCart(Cart cart) async {
    final docCart = FirebaseFirestore.instance.collection('Carts').doc();
    cart.id = docCart.id;
    await docCart.set(cart.toJson());
  }


  }




