// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print, unused_element, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:podcast_app/Config/components/FromError.dart';
import 'package:podcast_app/Config/components/login_signin_stuff.dart';
import 'package:podcast_app/Config/components/text_input.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';
import 'package:podcast_app/Config/validation_error_msg.dart';
import 'package:podcast_app/Screen/login_page.dart';
import 'package:podcast_app/Screen/main_page.dart';
import 'package:podcast_app/api/ConnectApi.dart';
import 'package:podcast_app/localDB/userDB.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //var
  dynamic formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwdCtrl = TextEditingController();
  final rePasswdCtrl = TextEditingController();
  final _myBox = Hive.box('mybox');

// function
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  _signin() async {
    var data = {
      'username': usernameCtrl.text,
      'email': emailCtrl.text,
      'password': passwdCtrl.text,
      'password_confirmation': rePasswdCtrl.text
    };
// make post request
    var response =
        await ConnectApi().postData(data: data, entryPoint: 'signin');
    if (response == false) {
      addError(
        error: 'cannot sign in',
      );
      return;
    }
    removeError(error: 'cannot sign in');

    var body = json.decode(response.body);

    // print(body);
    // return;

    // save in DB
    _myBox.put('token', body['token'].toString());
    _myBox.put('user', UserDB.parseUser(body));
  }

//build
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      backgroundColor: dark50,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: getWidth(19)),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(height: getHeight(10)),

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

                        text_input(
                          context,
                          'Username',
                          controller: usernameCtrl,
                          color: blue,
                          icon: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: msgUsernameEmpty);
                              return '';
                            } else if (value.length < 4) {
                              addError(error: msgUsernameLength);
                              return "";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: msgUsernameEmpty);
                              if (value.length >= 4) {
                                removeError(error: msgUsernameLength);
                              }
                            }
                          },
                        ),

                        SizedBox(height: getHeight(40)),

                        //email field
                        text_input(
                          context,
                          'Email Address',
                          controller: emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          color: blue,
                          icon: Icons.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: msgEmailEmpty);
                              return '';
                            } else if (!regExpEmailValidator.hasMatch(value)) {
                              addError(error: msgValidEmailError);
                              return "";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: msgEmailEmpty);
                              return "";
                            } else if (regExpEmailValidator.hasMatch(value)) {
                              removeError(error: msgValidEmailError);
                              return "";
                            }
                          },
                        ),

                        SizedBox(height: getHeight(40)),

                        // passwd

                        text_input(
                          context,
                          'Password',
                          controller: passwdCtrl,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: msgPasswdEmpty);
                              return "";
                            } else if (value.length < 8) {
                              addError(error: msgPasswdLength);
                              return "";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: msgPasswdEmpty);
                              return "";
                            } else if (value.length >= 8) {
                              removeError(error: msgPasswdLength);
                              return "";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: getHeight(40)),

                        text_input(
                          context,
                          'Re-Password',
                          controller: rePasswdCtrl,
                          color: blue,
                          icon: Icons.password,
                          passwd: passwdHidden,
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: msgPasswdDontMatch);
                              return "";
                            } else if (value != passwdCtrl.text) {
                              addError(error: msgPasswdDontMatch);
                              return "";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: msgPasswdDontMatch);
                              return "";
                            } else if (value == passwdCtrl.text) {
                              removeError(error: msgPasswdDontMatch);
                              return "";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: getHeight(20)),

                    //bottom
                    BtnArea(
                      icon: SvgPicture.asset('assets/svg/next-page-shadow.svg',
                          width: getHeight(150)),
                      function: () async {
                        if (formKey.currentState.validate()) {
                          //
                          await _signin();

                          print("sign-> ");
                          print("tokenDB-> " + _myBox.get('token').toString());

                          if (_myBox.get('token') != null) {
                            setState(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            });
                          } else {
                            addError(error: 'cannot sign in');
                          }
                        } else {
                          print("not valid-> ");
                        }
                      },
                    ),
                    SizedBox(height: getHeight(5)),

                    FormError(errors: errors),

                    SizedBox(height: getHeight(0)),

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
