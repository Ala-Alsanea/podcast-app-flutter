// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:podcast_app/Config/style.dart';

import '../size_config.dart';

Widget text_input(
  BuildContext context,
  String holder, {
  bool passwd = false,
  IconData? icon,
  IconButton? iconButton,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  Function()? press,
  Function(String)? onChanged,
}) {
  SizeOfConfig().init(context);

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: TextFormField(
      onTap: press,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 18, color: white),
      obscureText: passwd,
      decoration: InputDecoration(
        focusColor: Colors.grey[300],
        border: InputBorder.none,
        hintText: holder,
        hintStyle: TextStyle(color: white),
        prefixIcon: Icon(
          icon,
          color: white,
        ),
        prefixIconColor: white,
        suffixIcon: iconButton,
      ),
    ),
    decoration: BoxDecoration(
      color: dark100,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
