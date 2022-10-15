import 'package:flutter/material.dart';
import 'package:podcast_app/Screen/home_page.dart';
import 'package:podcast_app/Screen/main_page.dart';
import 'package:podcast_app/Screen/soon_page.dart';

final Map<String, WidgetBuilder> router = {
  MainPage.routerName: (context) => MainPage(),
  SoonPage.routerName: (context) => SoonPage(),
};
