import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endustry',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Color(0xff7F4192),
        backgroundColor: Color(0xfff3f3f3),
        dividerColor: Color(0xffbebebe),
        disabledColor: Color(0xffbebebe),
        fontFamily: 'CloudSoft',
        textTheme: TextTheme(body1: TextStyle(fontSize: 16))
      ),
      home: HomePage(),
    );
  }
}
