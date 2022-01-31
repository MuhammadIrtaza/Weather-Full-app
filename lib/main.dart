import 'package:flutter/material.dart';
import 'package:weather/Activity/home.dart';
import 'package:weather/Activity/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
      },
    );
  }
}
