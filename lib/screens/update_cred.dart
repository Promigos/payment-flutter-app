import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../utils/constants.dart';
import '../utils/http_modules.dart';
import '../utils/utils.dart';
import '../widgets/error_box.dart';

class UpdateCredentials extends StatefulWidget {
  const UpdateCredentials({Key? key}) : super(key: key);

  @override
  _UpdateCredentialsState createState() => _UpdateCredentialsState();
}

class _UpdateCredentialsState extends State<UpdateCredentials> {
  bool _isObscure = true;
  bool _isObscure1 = true;

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool showProgress = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('CHANGE PASSWORD',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: _isObscure,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Please enter password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Enter your current password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  obscureText: _isObscure1,
                  controller: _newPasswordController,
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Please enter password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Enter your new password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure1 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    ),
                  ),
                ),
              ),
              error == "" ? Container() : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                child: errorBox(error),
              ),

              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: showProgress
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                showProgress = true;
                              });
                              var res = await makePostRequest(
                                  json.encode({
                                    "newPassword": _newPasswordController.text,
                                    "currentPassword": _passwordController.text
                                  }),
                                  "/changePassword",
                                  null,
                                  true);
                              setState(() {
                                showProgress = false;
                              });
                              if (res.statusCode == 200) {
                                jwtTokenSet = json.decode(res.body)['token'];
                                showToast("Password changed successfully");
                                Navigator.of(context).pop();
                              } else {
                                showToast("Failed to change password");
                                setState(() {
                                  error = json.decode(res.body)['message'];
                                });
                              }
                            }
                          },
                          child: const Text(
                            'SAVE CHANGES',
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
