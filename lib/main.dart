import 'package:flutter/material.dart';
import 'login_page.dart'; // not complete 
import 'signup_page.dart'; // not complete
import 'setting_page.dart'; // not complete
import 'restaurantabout_.dart';
import 'notification_page.dart'; // not complete

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
      home: NotificationPage(),
    );
  }
}