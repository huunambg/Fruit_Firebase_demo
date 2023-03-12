import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_firebare_crud/Screens/singin/login.dart';
import 'package:food_firebare_crud/const/colors.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';

// day la man hinh dang ki
class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sg(),
    );
  }
}

class sg extends StatefulWidget {
  const sg({super.key});

  @override
  State<sg> createState() => _sgState();
}

class _sgState extends State<sg> {
  bool ischeckpass = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final retypepassword = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text("Singup"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 20,
            ),
            TextField(
                obscureText: ischeckpass,
                controller: passwordcontroller,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          ischeckpass = !ischeckpass;
                        });
                      },
                      child: Icon(ischeckpass
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 30,
            ),
            TextField(
                obscureText: ischeckpass,
                controller: retypepassword,
                decoration: InputDecoration(
                
                    labelText: "Retype-Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.green,
                  borderRadius: BorderRadius.circular(15)),
              height: 60,
              width: 250,
              child: TextButton(
                child: CustomTextGilroy_Bold(
                  text: "Singup",
                  color: Colors.white,
                ),
                onPressed: onpressed,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text("Back to Login"),
            )
          ],
        ),
      ),
    );
  }

// su kien kiem tra  tai khoan so voi database
  void onpressed() {
    if (emailcontroller.text != '' && passwordcontroller.text != '') {
      if (passwordcontroller.text != retypepassword.text) {
        CherryToast.error(title: Text("Re-entered password does not match"))
            .show(context);
      } else {
        singup();
      }
    }
  }

  Future singup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      CherryToast.error(title: Text(e.toString())).show(context);
    }
  }
}
