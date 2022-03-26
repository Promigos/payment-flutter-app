import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/screens/forgot_password_email.dart';
import 'package:payment_app/screens/home_page.dart';
import 'package:payment_app/utils/colors.dart' as colors;
import 'package:payment_app/utils/constants.dart' as constants;

import '../utils/http_modules.dart';
import '../utils/utils.dart';
import '../widgets/custom_sliver.dart';
import '../widgets/error_box.dart';
import 'forgot_passcode.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String error = "";

  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 1, bottom: 20),
                            child: Text(
                              'Login to APP NAME',
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: TextFormField(
                      controller: _emailController,
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Phone number or Email ID',
                            style: GoogleFonts.nunito(fontSize: 17)),
                        filled: true,
                        hintText: 'Enter your phone number or Email ID',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        // fillColor: colors.textBoxColor,
                        // focusColor: colors.textBoxColor,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: TextFormField(
                      controller: _passwordController,
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Password',
                            style: GoogleFonts.nunito(
                                // color: colors.textBoxTextColor,
                                fontSize: 17)),
                        filled: true,
                        hintText: 'Enter Password',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        // fillColor: colors.textBoxColor,
                        // focusColor: colors.textBoxColor,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: showProgress
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            child: const Text(
                              'LOG IN',
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  showProgress = true;
                                });
                                var res = await makePostRequest(
                                    json.encode({
                                      "email": _emailController.text,
                                      "password": _passwordController.text
                                    }),
                                    "/login",
                                    null,
                                    false);
                                setState(() {
                                  showProgress = false;
                                });
                                if (res.statusCode == 200) {
                                  showToast("Signed in successfully!");
                                  jwtTokenSet = json.decode(res.body)['token'];
                                  setName = json.decode(res.body)['name'];
                                  setEmailID = json.decode(res.body)['email'];
                                  setUserId = json.decode(res.body)['id'];
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  setState(() {
                                    error = json.decode(res.body)['message'];
                                  });
                                }
                              }
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));
                            },
                          ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const ForgotPasswordEmailField()));
                    },
                    child: const Text(
                      'Forgot Password',
                    ))
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
    ]);
  }
}
