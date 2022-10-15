// ignore_for_file: unused_import

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/Screen/explore_page.dart';
import 'package:podcast_app/Screen/login_page.dart';
import 'package:podcast_app/Screen/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ignore: prefer_const_constructors
      home: LoginPage(),
    );
  }
}
