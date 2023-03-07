import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_firebare_crud/Screens/home/components/cusstom_appbar.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/model/service.dart';
import 'package:food_firebare_crud/widgets/custom_banner.dart';
import 'package:food_firebare_crud/widgets/custom_button.dart';
import 'package:food_firebare_crud/widgets/custom_card.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final x = Service();
  List<Fruit> hihi = [];
// add fruit tu json vao firebase

  void addFruit() async {
    final String response = await rootBundle.loadString('assets/Fruits.json');
    var data = jsonDecode(response);
    for (var item in data["Fruits"]) {
      Fruit ob = new Fruit(
          name: item['name'],
          price: item['price'],
          image: item['images'],
          detail: item['detail']);

      x.addFruit(ob);
    }
  }

  @override
  void initState() {
    // addFruit();
    setState(() {});
    super.initState();
  }
// khoi tao khi Load man hinh

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusstomAppBar(context), //Appbar
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // form Seach store
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 243, 242, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        label: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.search),
                            SizedBox(
                              width: 5,
                            ),
                            CustomTextGilroy_Bold(text: "Seach store")
                          ],
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomBanner(), //banner
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextGilroy_Medium(text: "Exclusive Offer"),
                    CustomTextBt(
                      text: "See all",
                      onpressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //Listviews cua Exclusive Offer
                CustomCard(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextGilroy_Medium(text: "Best Selling"),
                    CustomTextBt(
                      text: "See all",
                      onpressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //Listviews cua Best Selling
                CustomCard()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextGilroy_Medium(text: "Groceries"),
              CustomTextBt(
                text: "See all",
                onpressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //Listviews cua Groceries
          CustomCardMini(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      //bottom bar
    );
  }
}
