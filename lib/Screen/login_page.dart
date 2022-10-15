// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:podcast_app/Config/components/login_signin_stuff.dart';
import 'package:podcast_app/Config/components/text_input.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/Screen/home_page.dart';
import 'package:podcast_app/Screen/main_page.dart';
import 'package:podcast_app/Screen/signin_page.dart';

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
          padding: EdgeInsets.symmetric(horizontal: getWidth(19)),
          // img bg not solved yet
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/svg/bg_login.svg'),
          //   ),
          // ),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(height: getHeight(50)),

                    // img
                    Center(
                      child: Container(
                        child: SvgPicture.asset('assets/svg/logo.svg'),
                      ),
                    ),

                    SizedBox(height: getHeight(50)),

                    //login header
                    Text('Login', style: bold_24()),

                    SizedBox(height: getHeight(20)),

                    //username field
                    Column(
                      children: [
                        text_input(context, 'Email Address',
                            color: blue, icon: Icons.email),

                        SizedBox(height: getHeight(40)),

                        // passwd

                        text_input(
                          context,
                          'Password',
                          color: blue,
                          passwd: passwdHidden,
                          icon: Icons.lock,
                          iconButton: IconButton(
                            onPressed: () {
                              setState(() {
                                passwdHidden = !passwdHidden;
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: getHeight(40)),

                    //bottom
                    BtnArea(
                        icon: Icons.arrow_forward_ios_outlined,
                        function: () {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return MainPage();
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
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
