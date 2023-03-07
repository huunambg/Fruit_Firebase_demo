import 'package:flutter/material.dart';
import 'package:food_firebare_crud/const/colors.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';

// floattingacction button
class CusstomFloatingActionButtonCart extends StatefulWidget {
  const CusstomFloatingActionButtonCart(
      {super.key, required this.onpresed, required this.text, this.sum});
  final GestureTapCallback onpresed;
  final String? text;
  final double? sum;

  @override
  State<CusstomFloatingActionButtonCart> createState() =>
      _CusstomFloatingActionButtonCartState();
}

class _CusstomFloatingActionButtonCartState
    extends State<CusstomFloatingActionButtonCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpresed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 57,
            width: 350,
            decoration: BoxDecoration(
                color: AppColor.green, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: CustomTextGilroy_Bold(
                text: widget.text,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 20,
            child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Color.fromARGB(31, 96, 92, 92),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: CustomTextGilroy_Bold(
                  text: "\$${widget.sum.toString()}",
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
          )
        ],
      ),
    );
  }
}
