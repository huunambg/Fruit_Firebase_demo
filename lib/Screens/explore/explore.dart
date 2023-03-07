import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'package:ionicons/ionicons.dart';
// day la Explore
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          height: 50,
          decoration: BoxDecoration(
              color: Color.fromRGBO(215, 218, 215, 1),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Ionicons.close_outline)),
                label: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 5,
                    ),
                    CustomTextGilroy_Bold(text: "Seach store")
                  ],
                ),
                border: InputBorder.none),
          ),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Ionicons.apps_outline))
        ],
      ),
    );
  }
}
