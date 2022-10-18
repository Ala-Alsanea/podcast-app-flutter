// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Screen/home_page.dart';
import 'package:podcast_app/Screen/login_page.dart';
import 'package:podcast_app/Screen/main_page.dart';
import 'package:podcast_app/localDB/userDB.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _myBox = Hive.box('mybox');

  // function

  _clearDB() {
    _myBox.delete('token');
    _myBox.delete('user');
  }

  void _toNextPage(var page) async {
    await Future.delayed(Duration(milliseconds: 2600), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  //
  @override
  void initState() {
    // _clearDB();
    print("tokenDB-> " + _myBox.get('token').toString());
    print("userDB-> " + _myBox.get('user').toString());
    if (_myBox.get('token') == null) {
      _toNextPage(LoginPage());
    } else {
      _toNextPage(MainPage());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      body: Center(
        child: Container(
          child: SvgPicture.asset('assets/svg/splash.svg', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
