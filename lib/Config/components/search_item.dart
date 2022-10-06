// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';

Widget search_item(BuildContext context,
    {String title = '', String subtitle = ''}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: dark100,
          borderRadius: BorderRadius.circular(10),
        ),
        width: SizeOfConfig.widthScreen,
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(10), vertical: getHeight(15)),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/logo.svg',
              width: getWidth(40),
              fit: BoxFit.cover,
            ),
            SizedBox(width: getWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: bold_24(),
                ),
                SizedBox(height: getHeight(5)),
                Text(
                  subtitle,
                  style: normal_18(),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: getHeight(20)),
    ],
  );
}
