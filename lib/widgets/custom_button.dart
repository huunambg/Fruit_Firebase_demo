import 'package:flutter/material.dart';

class CustomTextBt extends StatelessWidget {
  const CustomTextBt({super.key, required this.text, required this.onpressed});
  final String? text;
  final GestureTapCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "See All",
        style: TextStyle(
            fontFamily: "Gilroy",
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 83, 177, 117)),
      ),
      onPressed: onpressed,
    );
  }
}

