import 'package:first_project/screens/third_screen.dart';
import 'package:first_project/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_project/screens/first_screen.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const WebviewScreen(),
    );
  }
}
