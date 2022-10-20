// ignore_for_file: unnecessary_this

import 'package:hive_flutter/hive_flutter.dart';

class UserDB {
  String token = "";
  Map user = {};
  final myBox = Hive.box('mybox');

  setToken() {
    myBox.put('token', this.token);
  }

  getToken() {
    this.token = myBox.get('token');
  }

  static parseUser(data) => {
        'id': data['user']['id'],
        'email': data['user']['email'],
        'username': data['user']['username'],
      };

  clearDB() {
    myBox.delete('token');
    myBox.delete('user');
  }

  allClearDB() {
    myBox.delete('token');
    myBox.delete('user');
    myBox.delete('intro');
  }
}
