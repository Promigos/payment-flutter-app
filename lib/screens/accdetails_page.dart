import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/utils/constants.dart';

import '../utils/http_modules.dart';
import '../widgets/error_box.dart';

class AccDetails extends StatefulWidget {
  const AccDetails({Key? key}) : super(key: key);

  @override
  _AccDetailsState createState() => _AccDetailsState();
}

class _AccDetailsState extends State<AccDetails> {
  final _formKey = GlobalKey<FormState>();

  String accountNumber = "", expiryDate = "", cvv = "";
  bool showProgress = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Account'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Text('Account Details',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onSaved: (data) {
                  accountNumber = data!;
                },
                keyboardType: const TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Enter account number";
                  } else if (value.length != 16) {
                    return "Account number has to be 16 digits long";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Account Number',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onSaved: (data) {
                  expiryDate = data!;
                },
                keyboardType: const TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Enter expiry date";
                  } else if (value.length != 4) {
                    return "Expiry date has to be 3 digits long";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Expiry Date',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onSaved: (data) {
                  cvv = data!;
                },
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Enter CVV";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter CVV',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: textFieldPadding,
              child: error == "" ? Container() : errorBox(error),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      var res = await makePostRequest(
                          json.encode({
                            "account": int.parse(accountNumber),
                            "cvv": cvv,
                            "expiry": expiryDate,
                          }),
                          "/bank/addAccount",
                          null,
                          true, context: context);
                      setState(() {
                        showProgress = false;
                      });
                      if (res.statusCode == 200) {
                        setState(() {
                          error = "";
                        });
                        showToast("Account added successfully!");
                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          print(res.body);
                          error = json.decode(res.body)['message'];
                        });
                      }
                    }
                  },
                  child: const Text(
                    'ADD WALLET ACCOUNT',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
