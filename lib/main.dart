// ignore_for_file: unused_import, prefer_const_constructors, duplicate_ignore

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/Screen/explore_page.dart';
import 'package:podcast_app/Screen/home_page.dart';
import 'package:podcast_app/Screen/main_page.dart';
import 'package:podcast_app/Screen/splash_page.dart';

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
      home: HomePage(),
    );
  }
}
