// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:podcast_app/Screen/explore_page.dart';
import 'package:podcast_app/Screen/login_page.dart';
import 'package:podcast_app/Screen/main_page.dart';
import 'package:podcast_app/Screen/splash_page.dart';

void main() async {
// init hive fb
  await Hive.initFlutter();

  // open a box
  var box = Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
