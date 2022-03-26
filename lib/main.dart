import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/screens/AddMoneyForm.dart';
import 'package:payment_app/screens/home_page.dart';
import 'package:payment_app/screens/start_page.dart';
import 'package:payment_app/screens/unlock_page.dart';
import 'package:payment_app/utils/theme.dart';
import 'package:payment_app/widgets/load_valid_page_widget.dart';
import 'package:payment_app/screens/Settings.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const OKToast(
    child: MyApp(),
    position: ToastPosition.center,
  ));
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
      home: Settings()
      // home:  LoadValidPageWidget(const StartPage(), UnlockPage()),
    );

  }
}
