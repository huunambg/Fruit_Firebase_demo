import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/const/colors.dart';
import 'package:food_firebare_crud/screens/account/components/cusstom_item_account.dart';
import 'package:food_firebare_crud/screens/oder/orders.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromARGB(31, 110, 102, 102)))),
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Image.asset("assets/user.png"),
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      CustomTextGilroy_Bold(text: "Afsar Hossen "),
                      Icon(
                        Icons.auto_fix_high_outlined,
                        size: 15,
                      )
                    ],
                  ),
                  CustomTextGilroy_Bold(text: "${user!.email}")
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CusstomItemAcount(
              img: "assets/oder.png",
              text: "Order",
              onpressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              },
            ),
            CusstomItemAcount(
              img: "assets/my_details.png",
              text: "My Details",
            ),
            CusstomItemAcount(
              img: "assets/delivery_address.png",
              text: "Delivery Address",
            ),
            CusstomItemAcount(
              img: "assets/payment_methods.png",
              text: "Payment Methods",
            ),
            CusstomItemAcount(
              img: "assets/promo_cord.png",
              text: "Promo Cord",
            ),
            CusstomItemAcount(
              img: "assets/notifecations.png",
              text: "Notifecations ",
            ),
            CusstomItemAcount(
              img: "assets/help.png",
              text: "Help",
            ),
            CusstomItemAcount(
              img: "assets/about.png",
              text: "About ",
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(31, 114, 110, 110),
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 250,
                  child: Center(
                    child: TextButton(
                        child: CustomTextGilroy_Bold(
                          text: "Singout",
                          color: AppColor.green,
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        }),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
