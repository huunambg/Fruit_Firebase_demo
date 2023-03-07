import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CusstomItemAcount extends StatelessWidget {
  const CusstomItemAcount(
      {super.key, required this.text, required this.img, this.onpressed});
  final String text;
  final String img;
  final GestureTapCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromARGB(31, 110, 102, 102)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "$img",
                  height: 15,
                  width: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text("$text")
              ],
            ),
            Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }
}
