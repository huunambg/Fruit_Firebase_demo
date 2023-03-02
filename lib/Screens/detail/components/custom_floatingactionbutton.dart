import 'package:flutter/material.dart';
import 'package:food_firebare_crud/const/colors.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';


class CusstomFloatingActionButton extends StatelessWidget {
  const CusstomFloatingActionButton({super.key, required this.onpresed, required this.text});
  final GestureTapCallback onpresed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpresed,
      child: Container(
        height: 57,
        width: 350,
        decoration: BoxDecoration(
            color: AppColor.green, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: CustomTextGilroy_Bold(text: text,color: Colors.white,),
        ),
      ),
    );
  }
}
