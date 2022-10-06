// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podcast_app/Config/components/bottom_app_bar.dart';
import 'package:podcast_app/Config/components/header.dart';
import 'package:podcast_app/Config/components/search_item.dart';
import 'package:podcast_app/Config/components/text_input.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<Map> _allPodcasts = [
    {'id': 1, 'name': 'podcast1', 'author': 'person'},
    {'id': 2, 'name': 'podcast2', 'author': 'someone'},
    {'id': 3, 'name': 'podcast3', 'author': 'someone1'},
    {'id': 4, 'name': 'podcast4', 'author': 'someone2'},
    {'id': 5, 'name': 'podcast5', 'author': 'someone5'},
    {'id': 6, 'name': 'podcast6', 'author': 'someone55'},
    {'id': 7, 'name': 'podcast7', 'author': 'someone88'},
    {'id': 8, 'name': 'podcast8', 'author': 'person'},
    {'id': 9, 'name': 'podcast9', 'author': 'someone87'},
    {'id': 10, 'name': 'podcast10', 'author': 'someone565'},
    {'id': 11, 'name': 'podcast11', 'author': 'someone6'},
    {'id': 12, 'name': 'podcast12', 'author': 'someone'},
  ];

  List<Map> _foundPodcasts = [];

  // functions

  void search(String inputSearch) {
    List<Map> result = [];
    if (inputSearch.isEmpty) {
      result = _allPodcasts;
    } else {
      result = _allPodcasts.where((element) {
        return element.toString().toLowerCase().contains(inputSearch.trim());
      }).toList();
    }

    setState(() {
      _foundPodcasts = result;
    });
  }

  // @override

  @override
  void initState() {
    _foundPodcasts = _allPodcasts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(context, 'Explore'),
        SizedBox(height: getHeight(20)),
        text_input(context, 'Search here ...', icon: Icons.search,
            onChanged: (input) {
          search(input);
        }),
        SizedBox(height: getHeight(20)),
        Expanded(
          child: ListView.builder(
            itemCount: _foundPodcasts.length,
            itemBuilder: (BuildContext context, int index) {
              return search_item(context,
                  title: _foundPodcasts[index]['name'],
                  subtitle: _foundPodcasts[index]['author']);
            },
          ),
        ),
      ],
    );
  }
}
