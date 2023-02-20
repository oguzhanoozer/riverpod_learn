import 'dart:convert';
import 'dart:io';

import '../model/base_model.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<String> fakeHttpData({String url = "https://google.com"}) async {
    await Future.delayed(Duration(seconds: 3));
    return "Response from $url";
  }

  Future<dynamic> getUsers<T extends IBaseModel>(
      {required String url, required IBaseModel model}) async {
    final _response = await http.get(Uri.parse(url));
    if (_response.statusCode == HttpStatus.ok) {
      return _jsonBodyParser<T>(model, json.decode(_response.body));
    }
  }

  dynamic _jsonBodyParser<T>(IBaseModel model, dynamic data) {
    if (data is Map<String, dynamic>) {
      return model.fromJson(data);
    } else if (data is List) {
      var x = data.map((e) => model.fromJson(e)).toList().cast<T>();
      return data.map((e) => model.fromJson(e)).toList().cast<T>();
    } else {
      return data;
    }
  }
}
