// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:podcast_app/Config/components/login_signin_stuff.dart';
import 'package:podcast_app/Config/components/text_input.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/Screen/login_page.dart';
import 'package:podcast_app/Screen/main_page.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Sign in', style: bold_24()),
                        Container(
                          child: SvgPicture.asset('assets/svg/logo.svg',
                              width: 70),
                        ),
                      ],
                    ),

                    SizedBox(height: getHeight(20)),

                    //login header

                    SizedBox(height: getHeight(20)),
                    // fields
                    Column(
                      children: [
                        //username field

                        text_input(context, 'Username',
                            color: blue, icon: Icons.person),

                        SizedBox(height: getHeight(40)),

                        // email field
                        text_input(context, 'Email Address',
                            color: blue, icon: Icons.email),

                        SizedBox(height: getHeight(40)),

                        // passwd

                        text_input(
                          context,
                          'Password',
                          color: blue,
                          passwd: passwdHidden,
                          icon: Icons.password,
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
                        SizedBox(height: getHeight(40)),

                        text_input(
                          context,
                          'Re-Password',
                          color: blue,
                          icon: Icons.password,
                          passwd: passwdHidden,
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MainPage()),
                              );
                            });
                          }
                        }),

                    SizedBox(height: getHeight(60)),

                    // sign in now
                    Footer(
                      context,
                      text: "I already have an account !!",
                      btnText: 'Login',
                      function: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
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
