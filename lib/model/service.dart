import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/screens/oder/orders.dart';

class Service {
  Future addFruit(Fruit fruit) async {
    final docFruit = FirebaseFirestore.instance.collection('Fruits').doc();

    fruit.id = docFruit.id;
    await docFruit.set(fruit.toJson());
  }

  Future addCart(Carts cart) async {
    final docCart = FirebaseFirestore.instance.collection('Carts').doc();
    cart.id = docCart.id;
    await docCart.set(cart.toJson());
  }
  Future addOder(Oder order) async {
    final docOrders = FirebaseFirestore.instance.collection('Orders').doc();
    order.idOder = docOrders.id;
    await docOrders.set(order.toJson());
  }
    Future addFavourite(Fruit fruit) async {
    final docFavourites = FirebaseFirestore.instance.collection('Favourites').doc();
    fruit.id = docFavourites.id;
    await docFavourites.set(fruit.toJson());
  }
  Future getData() async {
    List items = [];

    try {
      await FirebaseFirestore.instance
          .collection('Carts')
          .get()
          .then((querysnapshot) {
        querysnapshot.docs.forEach((element) {
          items.add(element.data());
        });
      });
      return items;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
