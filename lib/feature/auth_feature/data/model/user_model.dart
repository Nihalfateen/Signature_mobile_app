
import 'package:flutter/material.dart';
class UserModel {
  String? token;
  int? userId;

  UserModel({this.token, this.userId});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    return data;
  }
}