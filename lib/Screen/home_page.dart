// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podcast_app/Config/components/bottom_app_bar.dart';
import 'package:podcast_app/Config/components/header.dart';
import 'package:podcast_app/Config/components/search_item.dart';
import 'package:podcast_app/Config/components/text_input.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(context, 'Home'),
        SizedBox(height: getHeight(40)),
        // new items
        Container(
          height: getHeight(200),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('New', style: bold_18()),
                  TextButton(
                    onPressed: () {},
                    child:
                        Text('See More ...', style: normal_16(color: orange)),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                        child: Image.asset('assets/img/temp_img.png'),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //favorite
        SizedBox(height: getHeight(30)),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Favorite', style: bold_18()),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Column(
                          children: [
                            Image.asset('assets/img/temp_img.png',
                                height: getHeight(120)),
                            SizedBox(height: getHeight(5)),
                            Text('datadatadatadata', style: normal_16()),
                            RichText(text: TextSpan(text: 'datadatadata')),
                          ],
                        ),
                      ),
                      onPressed: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
