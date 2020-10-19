
import 'package:flutter/material.dart';
import 'package:cookies/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cookies...',
      home: Login());
  }
}

