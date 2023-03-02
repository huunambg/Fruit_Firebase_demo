import 'package:flutter/material.dart';

//Banner
class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 40),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 221, 201, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/vegetable.png",
            height: 120,
            width: 120,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fresh Vegetables",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Get Up To 40% OFF",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 83, 177, 117)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
