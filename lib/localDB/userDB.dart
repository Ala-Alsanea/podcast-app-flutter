// ignore_for_file: unnecessary_this

import 'package:hive_flutter/hive_flutter.dart';

class UserDB {
  String token = "";
  Map user = {};
  final _myBox = Hive.box('mybox');

  setToken() {
    _myBox.put('token', this.token);
  }

  getToken() {
    this.token = _myBox.get('token');
  }

  static parseUser(data) => {
        'id': data['user']['id'],
        'email': data['user']['email'],
        'username': data['user']['username'],
      };
}
