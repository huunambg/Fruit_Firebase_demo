import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Custom_BottomnavigationBar extends StatelessWidget {
  const Custom_BottomnavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(Ionicons.heart_outline), label: "Favourite"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Account"),
      ],
    );
  }
}
