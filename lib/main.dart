import 'package:flutter/material.dart';
import 'package:payment_app/screens/home_page.dart';

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
      theme: ThemeData.light(),
      //TODO: change to login / signup page and send to home page if token found
      home: const HomePage(),
    );
  }
}

