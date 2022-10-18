// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:podcast_app/Config/style.dart';

bool passwdHidden = true;
var passwdIcon = Icons.remove_red_eye;

Padding BigTitle(String title, {double size = 40}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    ),
  );
}

Container BtnArea(
    {String text = "", dynamic icon = '', VoidCallback? function}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        CircleAvatar(
          backgroundColor: orange,
          // foregroundColor: Color(0xFFFFFFFF),
          radius: 40,

          child: TextButton(
            onPressed: function,
            child: icon,
          ),
        ),
      ],
    ),
  );
}

Container Footer(BuildContext context,
    {String text = '', String btnText = '', VoidCallback? function}) {
  return Container(
    child: Row(
      children: [
        Text(
          text,
          style: normal_16(),
        ),
        TextButton(
          onPressed: function,
          child: Text(
            btnText,
            style: bold_16(color: orange),
          ),
        ),
      ],
    ),
  );
}
