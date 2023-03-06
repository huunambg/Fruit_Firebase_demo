import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_firebare_crud/Screens/singin/login.dart';
import 'package:food_firebare_crud/Screens/root.dart';
import 'package:food_firebare_crud/widgets/custom_text.dart';
import 'Screens/onbording/onbording.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onbording(),
    );
  }
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: CustomTextGilroy_Bold(text: "error"));
          } else if (snapshot.hasData) {
           // CherryToast.success(title: Text("Đăng Nhập thành công")).show(context);
            return Root();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
