import 'package:flutter/material.dart';
import 'login_page.dart';
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
      home: LoginPage(), // กำหนดหน้าหลัก
    );
  }
}