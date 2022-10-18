// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podcast_app/Config/components/bottom_app_bar.dart';
import 'package:podcast_app/Config/components/bottom_app_bar_item.dart';
import 'package:podcast_app/Config/components/bottom_bar.dart';
import 'package:podcast_app/Config/components/header.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/Screen/explore_page.dart';
import 'package:podcast_app/Screen/home_page.dart';

class SoonPage extends StatefulWidget {
  SoonPage({Key? key}) : super(key: key);
  static String routerName = '/SoonPage';

  @override
  State<SoonPage> createState() => _SoonPageState();
}

class _SoonPageState extends State<SoonPage> {
  //
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      backgroundColor: dark50,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(19)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
              header(
                context,
                'soon',
                icon: Icons.arrow_back_ios,
                function: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
