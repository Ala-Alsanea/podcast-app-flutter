// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

const dynamic dark100 = Color(0xff0F1723);
const dynamic dark50 = Color(0xff222831);
const dynamic blue = Color(0xff00ADB5);
const Color orange = Color(0xffFF5722);
const dynamic white = Color(0xffeeeeee);

TextStyle normal_24({color = white}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle bold_24({color = white}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle normal_18({color = white}) => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: color,
    );

TextStyle bold_18({color = white}) => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color,
    );

TextStyle normal_16({color = white}) => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color,
    );

TextStyle bold_16({color = white}) => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );
