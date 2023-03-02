import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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