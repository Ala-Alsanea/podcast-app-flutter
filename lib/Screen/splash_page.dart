// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_app/Screen/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // function

  _toNextPage() async {
    await Future.delayed(
      Duration(seconds: 2),
      () {},
    );
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
    return Scaffold(
      body: Container(
        child: SvgPicture.asset('assets/svg/splash.svg', fit: BoxFit.cover),
      ),
    );
  }
}
