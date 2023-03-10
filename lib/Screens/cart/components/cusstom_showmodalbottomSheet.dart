import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/Screens/cart/oder_apected.dart';
import 'package:food_firebare_crud/Screens/detail/components/custom_floatingactionbutton.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/model/service.dart';
import 'package:food_firebare_crud/route.dart';
import 'package:food_firebare_crud/screens/cart/cart.dart';
import 'package:food_firebare_crud/screens/root.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:intl/intl.dart';

// day la ModalBottom
class CusstomItemshowModalBottomSheet extends StatefulWidget {
  const CusstomItemshowModalBottomSheet(
      {super.key, required this.sum, required this.f});
  final double? sum;
  final List<Carts> f;
  @override
  State<CusstomItemshowModalBottomSheet> createState() =>
      _CusstomItemshowModalBottomSheetState();
}

class _CusstomItemshowModalBottomSheetState
    extends State<CusstomItemshowModalBottomSheet> {
  var f = NumberFormat('###.0#', 'en_US');
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
            height: 500,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromARGB(66, 218, 203, 203)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextGilroy_Bold(
                          text: "Checkout",
                          size: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            "assets/delete.png",
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(66, 218, 203, 203)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextGilroy_Bold(
                                text: "Delivery",
                                size: 17,
                              ),
                              Row(
                                children: [
                                  CustomTextGilroy_Bold(
                                    text: "Select Method",
                                    size: 15,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.navigate_next,
                                        size: 25,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(66, 218, 203, 203)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextGilroy_Bold(
                                text: "Pament",
                                size: 17,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Image.asset(
                                        "assets/creditcard.png",
                                        height: 18,
                                        width: 18,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.navigate_next,
                                        size: 25,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(66, 218, 203, 203)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextGilroy_Bold(
                                text: "Promo Code",
                                size: 17,
                              ),
                              Row(
                                children: [
                                  CustomTextGilroy_Bold(
                                    text: "Pick discount",
                                    size: 16,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.navigate_next,
                                        size: 25,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(66, 218, 203, 203)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextGilroy_Bold(
                                text: "Total Cost",
                                size: 17,
                              ),
                              Row(
                                children: [
                                  CustomTextGilroy_Bold(
                                    text: "\$${f.format(widget.sum)}",
                                    size: 15,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.navigate_next,
                                        size: 25,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextGilroy(
                          text:
                              "By placing an order you agree to our \nTerms And Conditions",
                          size: 13,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CusstomFloatingActionButton(
                              onpresed: () {
                                add();
                                AppRouter.push(Root());
                              },
                              text: "Place Order"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  void add() {
    final delete = FirebaseFirestore.instance.collection("Carts");
    widget.f.forEach((element) {
      var x = Service();
      Oder o = new Oder();
      o.nameOder = element.name;
      o.quantity = element.quantity;
      o.image = element.image;
      o.statusOder = 1;
      o.money = double.parse(element.price.toString()) *
          double.parse(element.price.toString());
      o.dateOder = (DateFormat('MM-dd-yyyy').format(DateTime.now())).toString();
      ;
      o.expected = (DateFormat('MM-dd-yyyy').format(DateTime.now())).toString();
      ;
      o.detailOder = "Dang chuan bi";
      delete.doc("${element.id}").delete();
      x.addOder(o);
    });
  }
}
