import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../models/user_model.dart';
import '../utils/http_modules.dart';
import '../widgets/alert_dialog.dart';

class TransactionMultiple extends StatefulWidget {
  const TransactionMultiple({Key? key, required this.userData})
      : super(key: key);
  final List<UserModel> userData;

  @override
  _TransactionMultipleState createState() => _TransactionMultipleState();
}

//TODO Add server function to get available bank accounts
class _TransactionMultipleState extends State<TransactionMultiple> {
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  'Paying ${widget.userData.map((e) => e.name).toString().replaceAll("(", "").replaceAll(")", "")}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                    child: Text(
                  'Note: The amount will be equally split everyone, each user will receive ${amt / widget.userData.length} Rs',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                )),
              ),
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
                            "receiverId": widget.userData
                                .map(
                                  (e) => e.userID,
                                )
                                .toList(),
                            "splitAmount": true
                          }),
                          "/funds/transferAmount",
                          null,
                          true,
                          context: context);
                      setState(() {
                        showProgress = false;
                      });
                      print("RES: ");
                      print(res);
                      if (res.statusCode == 200) {
                        showToast("Payment was successful!");
                        Navigator.pop(context);
                      } else {
                        showToast(res.body);
                      }
                      Navigator.pop(context);
                    }, "Complete transaction?",
                        "Are you sure you want to transfer ${widget.userData.map((e) => e.name).toString().replaceAll("(", "").replaceAll(")", "")}");
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
