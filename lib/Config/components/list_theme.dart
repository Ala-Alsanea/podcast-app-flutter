// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:podcast_app/Config/components/constant.dart';

GestureDetector listTheme(String text, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    // ignore: duplicate_ignore, duplicate_ignore
    child: Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      // ignore: prefer_const_constructors
      child: Text(text, style: catText),
    ),
  );
}
