import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/model/service.dart';
import 'package:food_firebare_crud/screens/cart/components/cusstom_floatingactionbutton_cart.dart';
import 'package:food_firebare_crud/Screens/cart/components/cusstom_showModalBottomSheet.dart';
import 'package:food_firebare_crud/screens/detail/components/custom_floatingactionbutton.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:ionicons/ionicons.dart';

// Man hinh Favorite
class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(255, 239, 231, 231))),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text("Favourites"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Favourites').snapshots(),
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
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 15, 5, 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "${snapshot.data!.docs[index]['image'].toString()}",
                                  height: 60,
                                  width: 60,
                                ),
                                CustomTextGilroy_Bold(
                                    size: 18,
                                    text:
                                        "${snapshot.data!.docs[index]['name']}"),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextGilroy_Bold(
                                      text:
                                          "\$${snapshot.data!.docs[index]['price'].toString()}",
                                      size: 18,
                                    ),
                                    Icon(Icons.navigate_next)
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
      floatingActionButton: CusstomFloatingActionButton(
        onpresed: () {},
        text: "Add All to Cart",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
