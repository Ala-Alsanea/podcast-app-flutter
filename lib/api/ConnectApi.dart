// ignore_for_file: unused_field, unused_local_variable, avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;

class ConnectApi {
  final String _localUrl = 'http://10.42.0.1:8000/api/';
  final String _storageUrl = 'http://10.42.0.1:8000/storage/';

  getStorageUrl() {
    return _storageUrl;
  }

  getAllData({entryPoint = ""}) async {
    print(_localUrl + entryPoint);

    //
    http.Response response = await http.get(Uri.parse(_localUrl + entryPoint));
    try {
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response;
      }
      return 'false';
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
//

  postData({data, entryPoint = ""}) async {
    print(_localUrl + entryPoint);

    //
    http.Response response = await http.post(
      Uri.parse(_localUrl + entryPoint),
      body: jsonEncode(data),
      headers: _setHeader(),
    );
    try {
      print("state-> " + response.statusCode.toString());
      if (response.statusCode == 200) {
        return response;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  _setHeader({token = ''}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ' + token,
    };
  }
}
