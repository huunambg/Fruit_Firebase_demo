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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color.fromARGB(31, 110, 102, 102)),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      width: 2,
                    ),
                    CustomTextGilroy_Bold(text: "Hi!  "),
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
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CusstomItemAcount(
                    img: "assets/oder.png",
                    text: "Order",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                  CusstomItemAcount(
                    img: "assets/my_details.png",
                    text: "My Details",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                  CusstomItemAcount(
                    img: "assets/delivery_address.png",
                    text: "Delivery Address",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                  CusstomItemAcount(
                    img: "assets/payment_methods.png",
                    text: "Payment Methods",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                  CusstomItemAcount(
                    img: "assets/promo_cord.png",
                    text: "Promo Cord",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                  CusstomItemAcount(
                    img: "assets/notifecations.png",
                    text: "Notifecations ",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                  CusstomItemAcount(
                    img: "assets/help.png",
                    text: "Help",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                  CusstomItemAcount(
                    img: "assets/about.png",
                    text: "About ",
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                  ),
                ],
              ),
            ),

            //nut bam sigout
            Center(
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(31, 114, 110, 110),
                        borderRadius: BorderRadius.circular(15)),
                    height: 50,
                    width: 250,
                    child: Center(
                      child: CustomTextGilroy_Bold(
                        text: "Singout",
                        color: AppColor.green,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
