import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../models/user_model.dart';
import '../utils/http_modules.dart';
import '../widgets/alert_dialog.dart';

class Transaction extends StatefulWidget {
  Transaction({Key? key, required this.userData}) : super(key: key);
  final UserModel userData;

  @override
  _TransactionState createState() => _TransactionState();
}

//TODO Add server function to get available bank accounts
class _TransactionState extends State<Transaction> {

  bool showProgress = false;
  int amt = 1000;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colors.blue,
                  child: Text(
                    widget.userData.name[0],
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                    child: Text(
                      'Paying ${widget.userData.name}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 32),
                    )),
              ),
              Center(
                  child: Text(
                    widget.userData.phoneNumber,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  )),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: TextFormField(
                        initialValue: amt.toString(),
                        onChanged: (s) {
                          setState(() {
                            amt = int.parse(s);
                          });
                        },
                      ))
                ],
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: () {
                    displayDialog(context, "Yes", "No", () async {
                      setState(() {
                        showProgress = true;
                      });
                      var res = await makePostRequest(
                          json.encode({
                            "amount": amt,
                            "receiverId": [widget.userData.userID]
                          }),
                          "/funds/transferAmount",
                          null,
                          true, context: context);
                      setState(() {
                        showProgress = false;
                      });
                      if (res.statusCode == 200) {
                        showToast("Payment was successful!");
                        Navigator.pop(context);
                      } else {
                        showToast(res.body);
                      }
                      Navigator.pop(context);
                    }, "Complete transaction?",
                        "Are you sure you want to transfer ${amt} credits to ${widget.userData.name}");
                  },
                  child: const Center(
                    child: Text(
                      "Transfer Amount",
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
