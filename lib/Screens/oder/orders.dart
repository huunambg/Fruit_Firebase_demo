import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/screens/cart/components/cusstom_floatingactionbutton_cart.dart';
import 'package:food_firebare_crud/Screens/cart/components/cusstom_showModalBottomSheet.dart';
import 'package:food_firebare_crud/screens/detail/components/custom_floatingactionbutton.dart';
import 'package:food_firebare_crud/screens/oder/track_oder.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';

import 'package:ionicons/ionicons.dart';

class Orders extends StatefulWidget {
  Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int sl = 1;
  double sum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text("Oders"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Loi "),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    sum = double.parse(
                            snapshot.data!.docs[index]['money'].toString()) *
                        double.parse(
                            snapshot.data!.docs[index]['quantity'].toString());
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color.fromARGB(255, 239, 231, 231)),
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 247, 234, 234)))),
                      margin: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: 180,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrackOder(
                                          Order: snapshot.data!.docs[index],
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 5, 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "${snapshot.data!.docs[index]['image'].toString()}",
                                  height: 100,
                                  width: 100,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextGilroy_Bold(
                                      text:
                                          "${snapshot.data!.docs[index]['nameOder'].toString()}",
                                      size: 19,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    CustomTextGilroy(text: "1kg,Price"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextGilroy_Bold(
                                      text:
                                          "Quantity: ${snapshot.data!.docs[index]['quantity'].toString()}",
                                      size: 20,
                                    ),

                                          
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextGilroy_Bold(
                                      text:
                                          "Total: \$${snapshot.data!.docs[index]['money'].toString()}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
