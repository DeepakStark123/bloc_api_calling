import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_bloc_demo/models/user_model.dart';

class UserRepo {
  final dio = Dio();
  // var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  getUsers() async {
    final res = await dio.get("https://jsonplaceholder.typicode.com/users");
    debugPrint('response = ${res.data}');
    if (res.statusCode == 200) {
      return userModelFromJson(res.data.toString());
    } else {
      throw Exception("Failed to load products");
    }
  }
}
