// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Home/homeScreen.dart';
import 'package:flutter_web_1/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: KPrimaryColor,
      ),
      home: HomeScreen(),
    );
  }
}
