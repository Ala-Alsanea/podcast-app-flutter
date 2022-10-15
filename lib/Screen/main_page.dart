// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podcast_app/Config/components/bottom_app_bar.dart';
import 'package:podcast_app/Config/components/bottom_app_bar_item.dart';
import 'package:podcast_app/Config/components/bottom_bar.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/Screen/explore_page.dart';
import 'package:podcast_app/Screen/home_page.dart';
import 'package:podcast_app/Screen/soon_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  static String routerName = '/MainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static int _index = 0;
  final List _pages = [
    HomePage(),
    ExplorePage(),
  ];

  //
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      backgroundColor: dark50,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(19)),
        child: SafeArea(
          child: _pages[_index],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blue,
              offset: Offset(0, 50),
              blurRadius: 60,
              spreadRadius: 0,
            ),
          ],
        ),
        child: SizedBox.fromSize(
          size: Size(70, 70),
          child: FloatingActionButton(
            child: SvgPicture.asset('assets/svg/logo_white.svg', width: 45),
            backgroundColor: blue,
            disabledElevation: 10,
            onPressed: () {
              go_2_soon(context);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        bottomNu: _index,
        callBack: (index) {
          if (index == 2 || index == 3 || index == 4) {
            go_2_soon(context);
            return;
          }

          setState(() {
            _index = index;
          });
        },
      ),
    );
  }

  void go_2_soon(BuildContext context) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return SoonPage();
      }));
    });
  }
}
