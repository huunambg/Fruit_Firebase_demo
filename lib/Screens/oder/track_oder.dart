import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/model/class.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';

class TrackOder extends StatefulWidget {
  const TrackOder({super.key, this.Order});
  final Order;

  @override
  State<TrackOder> createState() => _TrackOderState();
}

class _TrackOderState extends State<TrackOder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text("Track-Oder"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextGilroy(text: "Order ID:  3354654654526"),
                CustomTextGilroy(text: "Order date: 03/12/2023"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Color.fromARGB(255, 222, 212, 212)))),
            child: EasyStepper(
              activeStep: int.parse(widget.Order['statusOder']),
              lineLength: 40,
              stepShape: StepShape.rRectangle,
              stepBorderRadius: 15,
              borderThickness: 2,
              padding: 20,
              stepRadius: 28,
              finishedStepBorderColor: Color.fromARGB(255, 34, 255, 71),
              finishedStepTextColor: Color.fromARGB(255, 34, 255, 56),
              finishedStepBackgroundColor: Color.fromARGB(255, 34, 255, 97),
              activeStepIconColor: Color.fromARGB(255, 34, 255, 97),
              loadingAnimation: 'assets/shipping.json',
              steps: const [
                EasyStep(
                  icon: Icon(Icons.add_task_rounded),
                  title: 'Order Placed',
                ),
                EasyStep(
                  icon: Icon(Icons.local_shipping_rounded),
                  title: 'Shipping',
                ),
                EasyStep(
                  icon: Icon(Icons.door_back_door_outlined),
                  title: 'On The Way',
                ),
                EasyStep(
                  icon: Icon(Icons.check_circle_outline_outlined),
                  title: 'Delivered',
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Color.fromARGB(255, 222, 212, 212)),
                    bottom: BorderSide(
                        width: 1, color: Color.fromARGB(255, 228, 214, 214)))),
            padding: EdgeInsets.fromLTRB(15, 15, 35, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "${widget.Order['image'].toString()}",
                      height: 70,
                      width: 70,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextGilroy_Bold(
                          text: "${widget.Order['nameOder'].toString()}",
                          size: 19,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        CustomTextGilroy(text: "1kg,Price"),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextGilroy(
                          text:
                              "Quantity: ${widget.Order['quantity'].toString()}",
                        ),
                      ],
                    ),
                    CustomTextGilroy_Bold(
                      text: "Total: \$${widget.Order['money'].toString()}",
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromARGB(255, 228, 214, 214)))),
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextGilroy_Bold(
                    text: "Detail: ${widget.Order['detail']}"),
                CustomTextGilroy_Bold(
                    text: "Expected: ${widget.Order['expected']}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
