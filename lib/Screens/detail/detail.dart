import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_firebare_crud/const/colors.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/model/service.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:ionicons/ionicons.dart';
import 'components/custom_floatingactionbutton.dart';

// day la man hinh chi tiet
class Detail extends StatefulWidget {
  const Detail({super.key, required this.f});
  final f; // luu du lieu tu click

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future<QuerySnapshot<Map<String, dynamic>>> data() async {
    final data = FirebaseFirestore.instance.collection("Carts").get();
    return data;
  }

  void inp() {
    print(data);
  }

  int sl = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            // khu vuc anh
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 231, 231),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.keyboard_return)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share))
                  ],
                ),
                Center(
                  child: Image.asset("${widget.f['image']}",
                      height: 250, width: 250),
                ),
              ],
            ),
          ),
          //phan thong tin san pham
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextGilroy_Bold(
                      text: "${widget.f['name']}",
                      size: 25,
                    ),
                    Icon(
                      Ionicons.heart_outline,
                      size: 30,
                    )
                  ],
                ),
                CustomTextGilroy_Medium(text: "1kg,Price"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (sl != 1) {
                                sl--;
                              }
                            });
                          },
                          icon: Image.asset(
                            "assets/minus.png",
                            height: 15,
                            width: 15,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Color.fromARGB(255, 197, 188, 188),
                                  width: 1)),
                          child: Center(
                              child: CustomTextGilroy_Bold(
                            text: "$sl",
                          )),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              sl++;
                            });
                            inp();
                          },
                          icon: Icon(Ionicons.add),
                        ),
                      ],
                    ),
                    CustomTextGilroy_Bold(
                      text: "S${widget.f['price']}",
                      size: 25,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextGilroy_Bold(
                            text: "Product Detail",
                            size: 17,
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextGilroy(
                        text: "${widget.f['detail']}",
                        size: 17,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextGilroy_Bold(
                            text: "Nutritions",
                            size: 17,
                          ),
                          Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextGilroy_Bold(
                            text: "Review",
                            size: 17,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColor.accent,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColor.accent,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColor.accent,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColor.accent,
                              ),
                              Icon(
                                Icons.star,
                                color: AppColor.accent,
                              ),
                              Icon(Icons.chevron_right_rounded),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      //button
      floatingActionButton: CusstomFloatingActionButton(
          onpresed: () {
            final x = Service();
            final cart = Cart(quantity: sl);
            cart.name = widget.f['name'];
            cart.detail = widget.f['detail'];
            cart.price = widget.f['price'];
            cart.image = widget.f['image'];
            x.addCart(cart);
            sl = 1;
            CherryToast.success(
                    title:
                        Text("${widget.f['name']} have been added to the cart"))
                .show(context);
          },
          text: "Add To Basket"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
