import 'package:flutter/material.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';

Widget bottom_app_bar_item({
  required Function()? onPressed,
  IconData? icon,
  Color color = white,
}) {
  return Container(
    child: icon != null
        ? IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: color,
              size: 30,
            ))
        : SizedBox(width: getWidth(30)),
  );
}
