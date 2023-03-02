import 'package:flutter/material.dart';
import 'package:food_firebare_crud/Screens/home/home.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';


class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onbordingpage(),
    );
  }
}

// Man hinh Onbording
class Onbordingpage extends StatefulWidget {
  const Onbordingpage({super.key});

  @override
  State<Onbordingpage> createState() => _OnbordingpageState();
}

class _OnbordingpageState extends State<Onbordingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 50),
            // Backgroud cua onbording
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img1.png"), fit: BoxFit.cover)),//anh nen
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.apple,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextGilroy_Bold(
                  text: "  Welcome \nto our store",
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextGilroy(text:"Ger your groceries in as fast as one hour",
                  color: Colors.white,size: 15,),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 83, 177, 117),
                        borderRadius: BorderRadius.circular(19)),
                    height: 67,
                    width: 330,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: CustomTextGilroy_Bold(text:
                          "Get Started",
                         color: Colors.white,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
