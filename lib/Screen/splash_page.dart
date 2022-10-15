// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Screen/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // function

  void _toNextPage() {
    Future.delayed(Duration(seconds: 1000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  //
  @override
  void initState() {
    super.initState();
    _toNextPage();
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/img/temp_img.png'),
        ),
      ),
    );
  }
}
