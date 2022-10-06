import 'package:flutter/material.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'bottom_app_bar_item.dart';

class bottom_app_bar extends StatefulWidget {
  bottom_app_bar(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<bottom_app_bar> createState() => _bottom_app_barState();
}

class _bottom_app_barState extends State<bottom_app_bar> {
  // ignore: unused_field, prefer_final_fields

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: dark100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bottom_app_bar_item(
                onPressed: () {}, icon: Icons.home, color: blue),
            bottom_app_bar_item(onPressed: () {}, icon: Icons.search),
            bottom_app_bar_item(onPressed: () {}),
            bottom_app_bar_item(onPressed: () {}, icon: Icons.podcasts),
            bottom_app_bar_item(onPressed: () {}, icon: Icons.person),
          ],
        ),
      ),
    );
  }
}
