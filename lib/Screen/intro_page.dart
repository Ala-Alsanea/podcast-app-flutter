// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/Screen/login_page.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);
// var
  final _myBox = Hive.box('mybox');

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Welcome to Podcast app',
      body: '',
      image: Center(
        child: Lottie.asset('assets/lottie/1.json'),
      ),
      decoration: PageDecoration(
          bodyFlex: 1, imageFlex: 2, titleTextStyle: bold_24(color: dark100)),
    ),
    PageViewModel(
      title: 'browse your favorites podcasts',
      body: '',
      image: Center(
        child: Lottie.asset('assets/lottie/3.json'),
      ),
      decoration: PageDecoration(
          bodyFlex: 1, imageFlex: 2, titleTextStyle: bold_24(color: dark100)),
    ),
    PageViewModel(
      title: 'Get start NOW',
      body: '',
      image: Center(
        child: Lottie.asset('assets/lottie/2.json'),
      ),
      decoration: PageDecoration(
          bodyFlex: 1, imageFlex: 2, titleTextStyle: bold_24(color: dark100)),
    ),
  ];

  // function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark50,
      body: Container(
        color: dark50,
        // padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            colors: [dark100, orange, blue],
            size: Size(15, 15),
            color: dark100,
            activeSize: Size.square(20),
            activeColor: blue,
          ),
          showDoneButton: true,
          done: Text('Done', style: normal_24(color: dark100)),
          showSkipButton: true,
          skip: Text('Skip', style: normal_24(color: dark100)),
          showNextButton: true,
          next: Text('Next', style: normal_24(color: dark100)),
          onDone: () => OnDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void OnDone(context) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('ON_BOARDING', false);
    _myBox.put('intro', true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
