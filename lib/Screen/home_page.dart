// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, sort_child_properties_last, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:podcast_app/Config/components/bottom_app_bar.dart';
import 'package:podcast_app/Config/components/header.dart';
import 'package:podcast_app/Config/components/search_item.dart';
import 'package:podcast_app/Config/components/text_input.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/api/ConnectApi.dart';
import 'package:podcast_app/api/model/podcast.dart';
import 'package:podcast_app/localDB/userDB.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// var
  final _myBox = Hive.box('mybox');
  var user = UserDB();
  var podcast = [];
  var _new = [];

// fun

  @override
  void initState() {
    getPodcast();

    super.initState();
  }

  getPodcast() async {
    var respond = await ConnectApi()
        .getAllData(entryPoint: 'allPodcasts', token: _myBox.get('token'));

    List list = await json.decode(respond.body);
    setState(() {
      podcast = list.map((e) => PodcastModel.fromJson(e)).toList();
    });

    print(podcast.length);
  }

//

  // @override

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            getPodcast();
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(context, 'Home'),
            SizedBox(height: getHeight(20)),
            // new items
            Container(
              height: getHeight(170),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('New', style: bold_18()),
                      // TextButton(
                      //   onPressed: () {},
                      //   child:
                      //       Text('See More ...', style: normal_16(color: orange)),
                      // )
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BtnWithImgAndTwoText(
                            img_size: 90, hor: 10, onPressed: () {}),
                        BtnWithImgAndTwoText(
                            img_size: 90, hor: 10, onPressed: () {}),
                        BtnWithImgAndTwoText(
                            img_size: 90, hor: 10, onPressed: () {}),
                        BtnWithImgAndTwoText(
                            img_size: 90, hor: 10, onPressed: () {}),
                        BtnWithImgAndTwoText(
                            img_size: 90, hor: 10, onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //allPodcasts
            SizedBox(height: getHeight(30)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('All', style: bold_18()),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          podcast.isEmpty
                              ? Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      CircularProgressIndicator.adaptive(),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                      SizedBox(height: getHeight(30)),
                                    ],
                                  ),
                                )
                              : Column(
                                  // padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  //     crossAxisCount: 2),
                                  children: podcast.map((pod) {
                                    return BtnWithImgAndTwoText(
                                      title: pod.title.length >= 30
                                          ? pod.title.substring(0, 30) + ' ...'
                                          : pod.title,
                                      author: pod.author.length >= 20
                                          ? pod.author.substring(0, 20) + ' ...'
                                          : pod.author,
                                      onPressed: () {
                                        print(pod.id);
                                      },
                                    );
                                  }).toList(),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget BtnWithImgAndTwoText({
  String img = 'assets/img/temp_img.png',
  double img_size = 200,
  String title = '',
  String author = '',
  double hor = 0,
  void Function()? onPressed,
}) {
  return Container(
    // height: getHeight(100),
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: getWidth(hor)),
    alignment: Alignment.center,
    child: TextButton(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          img == 'assets/img/temp_img.png'
              ? SvgPicture.asset('assets/svg/logo_XL.svg',
                  height: getHeight(img_size))
              : Image.network(ConnectApi().getStorageUrl() + img,
                  height: getHeight(img_size)),
          //  title
          title != '' ? SizedBox(height: getHeight(15)) : SizedBox(height: 0),
          title != '' ? Text(title, style: bold_16()) : SizedBox(height: 0),
          // author
          author != '' ? SizedBox(height: getHeight(5)) : SizedBox(height: 0),
          author != '' ? Text(author, style: normal_16()) : SizedBox(height: 0),
          author != '' ? SizedBox(height: getHeight(10)) : SizedBox(height: 0),
        ],
      ),
      onPressed: onPressed,
    ),
  );
}
