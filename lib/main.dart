import 'package:flutter/material.dart';
import 'package:medicineapp/view/basic_details.dart';
import 'package:medicineapp/view/login_page.dart';
import 'package:medicineapp/view/main_details.dart';
import 'package:medicineapp/view/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: SignInPage (),
    );
  }
}
