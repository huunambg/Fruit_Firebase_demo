import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/const/colors.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/model/service.dart';
import 'package:food_firebare_crud/screens/cart/components/cusstom_floatingactionbutton_cart.dart';
import 'package:food_firebare_crud/Screens/cart/components/cusstom_showModalBottomSheet.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:intl/intl.dart';

import 'package:ionicons/ionicons.dart';

class Cart extends StatefulWidget {
  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double sum = 0;
  var f = NumberFormat('###.0#', 'en_US');
  List<Carts> carts = [];
  @override
  void initState() {
    super.initState();
    fetchdatabaselist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(255, 247, 234, 234))),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text("My Cart"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Carts').snapshots(),
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
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 247, 234, 234)))),
                      margin: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: 180,
                        child: InkWell(
                          onTap: () {},
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
                                          "${snapshot.data!.docs[index]['name'].toString()}",
                                      size: 19,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    CustomTextGilroy(text: "1kg,Price"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 197, 188, 188),
                                                    width: 1)),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    double temprice =
                                                        double.parse(snapshot
                                                            .data!
                                                            .docs[index]
                                                                ['price']
                                                            .toString());
                                                    sum = sum - temprice;
                                                    int sl = int.parse(snapshot
                                                        .data!
                                                        .docs[index]['quantity']
                                                        .toString());
                                                    sl--;
                                                    final r = FirebaseFirestore
                                                        .instance
                                                        .collection("Carts")
                                                        .doc(
                                                            "${snapshot.data!.docs[index]['id'].toString()}");
                                                    r.update({'quantity': sl});
                                                    ;
                                                  });
                                                },
                                                icon: Icon(
                                                    Ionicons.remove_outline),
                                              ),
                                            )),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        CustomTextGilroy_Bold(
                                          text:
                                              "${snapshot.data!.docs[index]['quantity'].toString()}",
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 197, 188, 188),
                                                    width: 1)),
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    double temprice =
                                                        double.parse(snapshot
                                                            .data!
                                                            .docs[index]
                                                                ['price']
                                                            .toString());
                                                    sum = sum + temprice;
                                                    int sl = int.parse(snapshot
                                                        .data!
                                                        .docs[index]['quantity']
                                                        .toString());
                                                    sl++;
                                                    final r = FirebaseFirestore
                                                        .instance
                                                        .collection("Carts")
                                                        .doc(
                                                            "${snapshot.data!.docs[index]['id'].toString()}");
                                                    r.update({'quantity': sl});
                                                  });
                                                },
                                                icon: Icon(
                                                  Ionicons.add,
                                                  color: AppColor.green,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          final dele = FirebaseFirestore
                                              .instance
                                              .collection('Carts')
                                              .doc(
                                                  '${snapshot.data!.docs[index]['id'].toString()}');
                                          dele.delete();
                                        },
                                        icon: Image.asset(
                                          "assets/delete.png",
                                          height: 15,
                                          width: 15,
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextGilroy_Bold(
                                      text:
                                          "\$${snapshot.data!.docs[index]['price'].toString()}",
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
      floatingActionButton: CusstomFloatingActionButtonCart(
        onpresed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            context: context,
            builder: (context) {
              return CusstomItemshowModalBottomSheet(sum: sum, f: carts);
            },
          );
        },
        text: "Go To Checkout",
        sum: double.parse(f.format(sum)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // get data day vao list
  fetchdatabaselist() async {
    List items = [];
    dynamic _cart = await Service().getData();
    if (_cart == null) {
      print('error');
    } else {
      items = _cart;
      items.forEach((element) {
        Carts a = new Carts(
            id: element['id'],
            name: element['name'],
            image: element['image'],
            price: element['price'],
            detail: element['detail'],
            quantity: element['quantity']);
        carts.add(a);
        setState(() {
          //tinh tien cua cart
          sum +=
              double.parse(element['price'].toString()) * element['quantity'];
        });
      });
    }
  }
}
