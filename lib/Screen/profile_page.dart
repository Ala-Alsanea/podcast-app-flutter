// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors_in_immutables, non_constant_identifier_names, sort_child_properties_last, prefer_interpolation_to_compose_strings, avoid_print

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
import 'package:podcast_app/Screen/login_page.dart';
import 'package:podcast_app/api/ConnectApi.dart';
import 'package:podcast_app/api/model/podcast.dart';
import 'package:podcast_app/localDB/userDB.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
// var
  final _myBox = Hive.box('mybox');
  var user = UserDB();
  // var username =_myBox.get('user')['username'];

// fun
  _logout() async {
    var response = await ConnectApi()
        .postData(entryPoint: 'logout', token: _myBox.get('token'));
  }
//

  // @override

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(context, 'profile'),
        SizedBox(height: getHeight(20)),
        //

        // info
        Row(
          children: [
            Container(child: Icon(Icons.person, color: white, size: 80)),
            SizedBox(width: getWidth(10)),
            _myBox.get('user') != null
                ? Column(
                    children: [
                      Text(_myBox.get('user')['username'].toString(),
                          style: bold_24()),
                      Text(_myBox.get('user')['email'].toString(),
                          style: bold_24()),
                    ],
                  )
                : Column(),
          ],
        ),

        SizedBox(height: getHeight(20)),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () async {
                  _logout();
                  user.clearDB();

                  print("tokenDB-> " + _myBox.get('token').toString());

                  if (_myBox.get('token') == null) {
                    setState(() {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  }
                },
                child: Text('Logout')),
          ],
        )
      ],
    );
  }
}
