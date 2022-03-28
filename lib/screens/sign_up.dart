import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/screens/login_page.dart';
import 'package:payment_app/utils/constants.dart' as constants;
import '../utils/http_modules.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/custom_sliver.dart';
import '../widgets/error_box.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _otpFormState = GlobalKey<FormFieldState>();

  String? name, email, phoneNumber, password, passwordRepeat;
  String error = "";
  bool otpButtonDisabled = true;
  bool showProgress = false;

  String OTP = "";
  String enteredOTP = "";

  void _sendSMS(List<String> phoneNumbers) async {
    //TODO: Generate OTP here
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
          body: CustomSliverView(
        columnList: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container())),
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
                              'Register with APP NAME',
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
                      onSaved: (value) {
                        name = value;
                      },
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter a valid name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Name',
                            style: GoogleFonts.nunito(fontSize: 17)),
                        filled: true,
                        hintText: 'Enter your name',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: TextFormField(
                      onSaved: (value) {
                        phoneNumber = value;
                      },
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter a valid phone number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Phone number',
                            style: GoogleFonts.nunito(fontSize: 17)),
                        filled: true,
                        hintText: 'Enter your phone number',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: TextFormField(
                      onSaved: (value) {
                        email = value;
                      },
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter E-Mail";
                        } else if (!EmailValidator.validate(value)) {
                          return "Invalid Email";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Email ID',
                            style: GoogleFonts.nunito(fontSize: 17)),
                        filled: true,
                        hintText: 'Enter your Email ID',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            obscureText: true,
                            onSaved: (value) {
                              password = value;
                              print(password);
                            },
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Enter Password";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.nunito(fontSize: 17),
                            decoration: InputDecoration(
                              label: Text('Password',
                                  style: GoogleFonts.nunito(fontSize: 17)),
                              filled: true,
                              hintText: 'Enter password',
                              hintStyle: GoogleFonts.poppins(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ),
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            key: _otpFormState,
                            obscureText: true,
                            onSaved: (value) {
                              passwordRepeat = value;
                            },
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Enter password";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.nunito(fontSize: 17),
                            decoration: InputDecoration(
                              label: Text('Re-enter Password',
                                  style: GoogleFonts.nunito(fontSize: 17)),
                              filled: true,
                              hintText: 'Re-enter Password',
                              hintStyle: GoogleFonts.poppins(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      child: const Text(
                        'Send OTP',
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          //TODO: Generate OTP here
                          _sendSMS([phoneNumber!]);
                          setState(() {
                            otpButtonDisabled = false;
                          });
                        } else {
                          setState(() {
                            otpButtonDisabled = true;
                          });
                        }

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const HomePage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                      onSaved: (data) {
                        enteredOTP = data!;
                      },
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Enter OTP";
                        } else {
                          return null;
                        }
                      },
                      style: GoogleFonts.nunito(fontSize: 17),
                      decoration: InputDecoration(
                        label: Text('OTP',
                            style: GoogleFonts.nunito(fontSize: 17)),
                        filled: true,
                        hintText: 'Enter OTP',
                        hintStyle: GoogleFonts.poppins(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      )),
                ),
                showProgress
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: otpButtonDisabled
                            ? null
                            : () async {
                                //TODO: Verify OTP and get firebase jwt
                                if (_otpFormState.currentState!.validate()) {
                                  _otpFormState.currentState!.save();

                                  if (enteredOTP == OTP) {
                                    showToast("OTP MATCH!");
                                  }

                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    if (password != passwordRepeat) {
                                      setState(() {
                                        error = "Passwords don't match";
                                      });
                                    } else {
                                      setState(() {
                                        error = "";
                                        showProgress = true;
                                      });
                                      var res = await makePostRequest(
                                          json.encode({
                                            "password": password,
                                            "email": email,
                                            "phoneNumber": phoneNumber,
                                            "countryCode": 91,
                                            "userLocation": [],
                                            "name": name
                                          }),
                                          "/register",
                                          null,
                                          false);
                                      setState(() {
                                        showProgress = false;
                                      });
                                      if (res.statusCode == 200) {
                                        error = '';
                                        displayDialog(context, "Continue", null,
                                            () {
                                          Navigator.of(context).pop();
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage()));
                                        }, "Account has been registered",
                                            "Please check your mail and open the verification link within the next 15 minutes to complete registration\n\n(Check your Junk Mail/Spam if you haven't received it yet)");
                                      } else {
                                        setState(() {
                                          error =
                                              json.decode(res.body)['message'];
                                        });
                                      }
                                    }
                                  }
                                }
                              },
                        child: const SizedBox(
                            height: 40,
                            child: Center(child: Text('Verify OTP'))))
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
