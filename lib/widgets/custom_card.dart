import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_firebare_crud/Screens/detail/detail.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/model/service.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:ndialog/ndialog.dart';

// Day la listviews card hozirol tu db cua Exclusive Offer,Best Selling,
class CustomCard extends StatefulWidget {
  CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final detailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        height: 260,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Fruits').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Loi hihi"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 5),
                      child: SizedBox(
                        width: w * 0.45,
                        child: Card(
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 197, 190, 190))),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onLongPress: () async {
                              NDialog(
                                dialogStyle: DialogStyle(titleDivider: true),
                                title: Text("Mời bạn chọn chức năng"),
                                content: Text("hihi"),
                                actions: <Widget>[
                                  TextButton(
                                      child: Text("Sửa"),
                                      onPressed: () {
                                        namecontroller.text =
                                            snapshot.data!.docs[index]['name'];
                                        pricecontroller.text = snapshot
                                            .data!.docs[index]['price']
                                            .toString();
                                        detailcontroller.text = snapshot
                                            .data!.docs[index]['detail'];

                                        Navigator.pop(context);
                                        NDialog(
                                          dialogStyle:
                                              DialogStyle(titleDivider: true),
                                          title: Text("Nhập thông tin cần sửa"),
                                          content: Column(
                                            children: [
                                              TextField(
                                                  controller: namecontroller,
                                                  decoration: InputDecoration(
                                                      labelText: "Tên",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)))),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextField(
                                                  controller: pricecontroller,
                                                  decoration: InputDecoration(
                                                      labelText: "Giá",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)))),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              TextField(
                                                  controller: detailcontroller,
                                                  decoration: InputDecoration(
                                                      labelText: "Chi Tiết",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)))),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                child: Text("Okay"),
                                                onPressed: () {
                                                  final user = FirebaseFirestore
                                                      .instance
                                                      .collection('Fruits')
                                                      .doc(
                                                          '${snapshot.data.docs[index]['id']}');
                                                  user.update({
                                                    'name':
                                                        '${namecontroller.text}',
                                                    'price':
                                                        '${pricecontroller.text}',
                                                    'detail':
                                                        '${detailcontroller.text}'
                                                  });
                                                  namecontroller.text = '';
                                                  pricecontroller.text = '';
                                                  detailcontroller.text = '';
                                                  Navigator.pop(context);
                                                }),
                                            TextButton(
                                                child: Text("Close"),
                                                onPressed: () =>
                                                    Navigator.pop(context)),
                                          ],
                                        ).show(context);
                                      }),
                                  TextButton(
                                      child: Text("Xóa"),
                                      onPressed: () {
                                        final dele = FirebaseFirestore.instance
                                            .collection('Fruits')
                                            .doc(
                                                '${snapshot.data!.docs[index]['id'].toString()}');
                                        dele.delete();
                                        Navigator.pop(context);
                                      }),
                                ],
                              ).show(context);
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                          f: snapshot.data!.docs[index])));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      "${snapshot.data!.docs[index]['image'].toString()}",
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    children: [
                                      CustomTextGilroy_Bold(
                                        text:
                                            "${snapshot.data!.docs[index]['name']}",
                                        size: 19,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextGilroy_Bold(
                                        text:
                                            "\$${snapshot.data!.docs[index]['price'].toString()} .",
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(83, 177, 117, 1),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            final x = Service();
                                            final cart = Carts(quantity: 1);
                                            cart.name = snapshot
                                                .data!.docs[index]['name'];
                                            cart.detail = snapshot
                                                .data!.docs[index]['detail'];
                                            cart.price = snapshot
                                                .data!.docs[index]['price'];
                                            cart.image = snapshot
                                                .data!.docs[index]['image'];
                                            x.addCart(cart);

                                            CherryToast.success(
                                                    title: Text(
                                                        "${snapshot.data!.docs[index]['name']} have been added to the cart"))
                                                .show(context);
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

// Day la listviews card hozirol tu db cua Groceries,
class CustomCardMini extends StatefulWidget {
  CustomCardMini({super.key});

  @override
  State<CustomCardMini> createState() => _CustomCardMiniState();
}

class _CustomCardMiniState extends State<CustomCardMini> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        height: 110,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Fruits').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Loi hihi"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: w * 0.65,
                        child: Card(
                          color: Color.fromARGB(255, 212, 155, 181),
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onLongPress: () async {
                              final dele = FirebaseFirestore.instance
                                  .collection('Fruits')
                                  .doc('${snapshot.data!.docs[index]['id']}');
                              dele.delete();
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail(
                                          f: snapshot.data!.docs[index])));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "${snapshot.data!.docs[index]['image'].toString()}",
                                        height: 70,
                                        width: 70,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomTextGilroy_Bold(
                                        text:
                                            "${snapshot.data!.docs[index]['name'].toString()}",
                                        size: 19,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
