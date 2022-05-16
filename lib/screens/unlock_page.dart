import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/utils/local_auth.dart';
import 'package:payment_app/widgets/custom_sliver.dart';
import 'package:payment_app/utils/constants.dart' as constants;
import 'package:local_auth/local_auth.dart';
import 'package:payment_app/widgets/password_widget.dart';

import '../utils/http_modules.dart';
import '../widgets/error_box.dart';
import 'home_page.dart';

class UnlockPage extends StatefulWidget {
  late String userName = "User";

  UnlockPage({Key? key}) : super(key: key);

  @override
  _UnlockPageState createState() => _UnlockPageState();
}

class _UnlockPageState extends State<UnlockPage> {
  final _formKey = GlobalKey<FormState>();
  static final _auth = LocalAuthentication();

  bool showProgress = false;
  String error = "";
  String password = "";

  hasBiometrics() async {
    bool canCheckBiometrics = await _auth.canCheckBiometrics;
    print(canCheckBiometrics);
    return canCheckBiometrics;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: hasBiometrics(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Stack(children: [
                  Container(),
                  Scaffold(
                      body: CustomSliverView(
                    columnList: [
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 80, bottom: 30),
                              child: Text(
                                'Welcome ${widget.userName}',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: constants.textFieldPadding,
                              child: PasswordFormFieldWidget(
                                key:Key('unlockpwd'),
                                onSaved: (data) {
                                  password = data!;
                                },
                                style: GoogleFonts.montserrat(),
                                validator: (value) {
                                  if (value == "" || value == null) {
                                    return "Password cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                hintText: 'Enter Password!',
                                label: 'Password',
                              ),
                            ),
                            Row(
                              children: [
                                if (snapshot.data == true)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(),
                                        child: const Text(
                                          'Finger Print',
                                        ),
                                        onPressed: () async {
                                          final isAuthenticated =
                                              await LocaLAuthApi.authenticate();
                                          if (isAuthenticated) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()));
                                          } else {
                                            print("Authenticate failed!");
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: showProgress
                                      ? const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: CircularProgressIndicator(),
                                        )
                                      : ElevatedButton(
                                          key:Key('unlockbtn'),
                                          style: ElevatedButton.styleFrom(),
                                          child: const Text(
                                            'Unlock',
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              setState(() {
                                                showProgress = true;
                                              });
                                              var res = await makePostRequest(
                                                  json.encode(
                                                      {"password": password}),
                                                  "/validatePassword",
                                                  null,
                                                  true, context: context);
                                              setState(() {
                                                showProgress = false;
                                              });
                                              if (res.statusCode == 200) {
                                                setState(() {
                                                  error = "";
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const HomePage()));
                                                });
                                              } else {
                                                setState(() {
                                                  print(res.body);
                                                  error = json.decode(
                                                      res.body)['message'];
                                                });
                                              }
                                            }
                                          },
                                        ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: constants.textFieldPadding,
                        child: error == "" ? Container() : errorBox(error),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ))
                ])
              : CircularProgressIndicator();
        });
  }
}
