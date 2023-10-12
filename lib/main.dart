import 'package:api/HomePage.dart';
import 'package:api/Post1/Post1.dart';
import 'package:api/api1/Test1.dart';
import 'package:api/api2/test2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
        body: LoginPage(),
      ),
    );
  }
}
