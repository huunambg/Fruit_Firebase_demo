import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/screens/account/account.dart';
import 'package:food_firebare_crud/screens/cart/cart.dart';
import 'package:food_firebare_crud/screens/home/home.dart';
import 'package:ionicons/ionicons.dart';
import 'oder/track_oder.dart';

class Root extends StatefulWidget {
  const Root({super.key});
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final tabs = [
    Home(),
    Container(
      child: Center(
        child: Text("Explore"),
      ),
    ),
    Cart(),
    Container(
      child: Center(
        child: Text("Favourite"),
      ),
    ),
    Account()
  ];
  int _curentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_curentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentindex,
        onTap: (value) {
          setState(() {
            _curentindex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.heart_outline), label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),
    );
  }
}
