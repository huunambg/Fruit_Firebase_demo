import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_firebare_crud/Screens/singup/singup.dart';
import 'package:food_firebare_crud/const/colors.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
// day la man hinh login
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: lg(),
    );
  }
}

class lg extends StatefulWidget {
  const lg({super.key});

  @override
  State<lg> createState() => _lgState();
}

class _lgState extends State<lg> {
  bool ischeckpass = true;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
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
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
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
            Container(
              decoration: BoxDecoration(
                  color: AppColor.green,
                  borderRadius: BorderRadius.circular(15)),
              height: 60,
              width: 250,
              child: TextButton(
                child: CustomTextGilroy_Bold(
                  text: "Login",
                  color: Colors.white,
                ),
                onPressed: () {
                  if (emailcontroller.text != '' &&
                      passwordcontroller.text != '') {
                    sigin();
                  } else {
                    CherryToast.error(
                            title: Text("Vui Lòng nhập kiểm tra dữ liệu nhập"))
                        .show(context);
                  }
                },
              ),
            ),
            TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Singup())),
                child: Text("Singup"))
          ],
        ),
      ),
    );
  }

  Future sigin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      CherryToast.error(title: Text("Tài Khoản hoặc mật khẩu không chính xác"))
          .show(context);
    }
  }
}
