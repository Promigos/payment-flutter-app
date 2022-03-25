import 'package:flutter/material.dart';

class UserModel {
  String userID;
  String name;
  String email;
  String phoneNumber;

  UserModel(
      {required this.userID,
      required this.name,
      required this.email,
      required this.phoneNumber});
}
