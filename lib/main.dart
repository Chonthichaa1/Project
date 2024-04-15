import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'setting_page.dart';
import 'restaurantabout_.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBarDemo(),
    );
  }
}