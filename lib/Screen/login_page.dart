// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:podcast_app/Config/components/login_signin_stuff.dart';
import 'package:podcast_app/Config/components/text_input.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/Screen/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //var
  dynamic formKey = GlobalKey<FormState>();

//build
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      backgroundColor: dark50,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          // img bg not solved yet
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/svg/bg_login.svg'),
            ),
          ),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(height: getHeight(100)),
                    //login header
                    Text('Login', style: bold_24()),

                    SizedBox(height: getHeight(50)),

                    //username field
                    Column(
                      children: [
                        text_input(context, 'Username'),

                        SizedBox(height: getHeight(20)),

                        // passwd

                        text_input(
                          context,
                          'Password',
                          passwd: passwdHidden,
                          iconButton: IconButton(
                            onPressed: () {
                              setState(() {
                                passwdHidden = !passwdHidden;
                                if (passwdIcon ==
                                    Icon(Icons.remove_red_eye_outlined)) {
                                  passwdIcon = Icon(Icons.remove_red_eye);
                                  print('1');
                                  print(passwdIcon ==
                                      Icon(Icons.remove_red_eye_outlined));
                                } else {
                                  passwdIcon =
                                      Icon(Icons.remove_red_eye_outlined);
                                  print('0');
                                  print(passwdIcon);
                                  print(passwdIcon ==
                                      Icon(Icons.remove_red_eye_outlined));
                                }
                              });
                            },
                            icon: passwdIcon,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: getHeight(40)),

                    //bottom
                    BtnArea(
                        text: 'Login',
                        function: () {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return HomePage();
                                }),
                              );
                            });
                          }
                        }),

                    SizedBox(height: getHeight(100)),

                    // sign in now
                    Footer(
                      context,
                      text: "I don't have an account !!",
                      btnText: 'Sign in now',
                      function: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Container();
                            },
                          ));
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
