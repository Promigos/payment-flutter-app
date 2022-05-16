import 'dart:ffi';

import 'package:flutter/material.dart';

class UserModel {
  String userID;
  String name;
  String email;
  String phoneNumber;
  bool isChecked = false;

  UserModel(
      {required this.userID,
      required this.name,
      required this.email,
      required this.phoneNumber});
}
