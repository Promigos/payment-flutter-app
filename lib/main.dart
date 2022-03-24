import 'package:flutter/material.dart';
import 'package:payment_app/screens/AddMoneyForm.dart';
import 'package:payment_app/screens/start_page.dart';
import 'package:payment_app/utils/theme.dart';
import 'package:payment_app/screens/select_person.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      //TODO: change to login / signup page and send to home page if token found
      home: Select(),
    );
  }
}

