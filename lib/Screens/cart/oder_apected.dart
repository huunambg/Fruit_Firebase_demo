import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/Screens/detail/components/custom_floatingactionbutton.dart';
import 'package:food_firebare_crud/Screens/home/home.dart';
import 'package:food_firebare_crud/Screens/root.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:food_firebare_crud/screens/oder/orders.dart';
// day la man hinh Thong bao oder thanh cong
class OderApected extends StatelessWidget {
  const OderApected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/oder.jpg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextGilroy_Bold(
                text: "Your Order has been",
                size: 20,
              ),
              CustomTextGilroy_Bold(
                text: "accepted",
                size: 20,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextGilroy(text: "Your items has been placcd and is on"),
              CustomTextGilroy(
                text: "it’s way to being processed",
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CusstomFloatingActionButton(
                  onpresed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Orders()));
                  },
                  text: 'Track Order'),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Root()));
                  },
                  child: CustomTextGilroy_Bold(
                    text: "Back to home",
                    color: Colors.black,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
