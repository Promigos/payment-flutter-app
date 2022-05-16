import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:string_validator/string_validator.dart';
class NameFieldValidator{
  static String? validate(String value){
    if (value == "" || value == null) {
      return "Please enter a valid name";
    } else if (isAlpha(value)){
      return null;
    }
    else{
      return "Only alphabets allowed in name";
    }
  }
}
class PhoneNumberFieldValidator{
  static String? validate(String value){
    if (value == "" || value == null) {
      return "Please enter a valid phone number";
    } else if (double.tryParse(value) != null){
      return null;
    }
    else{
      return "Only numbers allowed in phone number";
    }
  }
}
class OTPFieldValidator {
  static String? validate(String value) {
    if (value == "" || value == null) {
      return "Enter OTP";
    }
    else if (double.tryParse(value) != null){
      return null;
    }
    else{
      return "Only numbers allowed in OTP";
    }
  }
}
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
  String verificationId = "";

  _generateOTP() async {
    if(phoneNumber == null){
      showToast("Please enter number");
      return;
    }
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 ${phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) {
        showToast("Verification successful!");
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e);
        showToast("Something went wrong!");
        if (e.code == 'invalid-phone-number') {
          showToast("Invalid phone number");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        showToast("OTP Sent!");
        print(verificationId);
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // this.verificationId = verificationId;
      },
    );
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
                      validator: (value) => NameFieldValidator.validate(value!),
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
                      validator: (value) => PhoneNumberFieldValidator.validate(value!),
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
                            validator: (value) => PasswordFieldValidator.validate(value!),
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
                            validator: (value) =>PasswordFieldValidator.validate(value!),
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
                          _generateOTP();
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
                      onChanged: (data) {
                        enteredOTP = data;
                      },
                      validator: (value) => OTPFieldValidator.validate(value!),
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
                                if (_otpFormState.currentState!.validate() && enteredOTP.isNotEmpty) {
                                  _otpFormState.currentState!.save();

                                  print(enteredOTP);

                                  // var _credential = PhoneAuthProvider.credential(verificationId: actualCode, smsCode: smsCodeController.text);

                                  await FirebaseAuth.instance
                                      .signInWithCredential(PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: enteredOTP))
                                      .then((value) async {
                                    if (value.user != null) {
                                      //TODO: use this token to login
                                      print(value.user);
                                      print(await value.user!.getIdToken());

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
                                                "countryCode": 91,
                                                "userLocation": [],
                                                "name": name,
                                                "phoneValidationJWT": await value.user!.getIdToken()
                                              }),
                                              "/register",
                                              null,
                                              false, context: context);
                                          setState(() {
                                            showProgress = false;
                                          });
                                          print(res.statusCode);
                                          print(json.decode(res.body)['message']);
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
                                  }).catchError((error, stackTrace) {
                                    print("outer: $error");
                                    var errorMessage = error.toString().split("]");
                                    showToast(errorMessage[1]);
                                    return;
                                  });
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
