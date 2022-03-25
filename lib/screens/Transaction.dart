import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  @override
  void initState() {
    super.initState();
  }

  String? acc;
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    int amt = 1000;

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: makePostRequest(null, "/accounts", null, true,
                context: context),
            builder: (context, AsyncSnapshot<http.Response> snapshot) {
              print(snapshot.data!.body);
              List<DropdownMenuItem<String>> accountsWidget = [];
              print(json.decode(snapshot.data!.body));
              if (snapshot.hasData) {
                acc = json.decode(snapshot.data!.body)['data'][0].toString();
                print(json.decode(snapshot.data!.body)['data'][0].toString());
                for (var i in json.decode(snapshot.data!.body)['data']) {
                  accountsWidget.add(DropdownMenuItem(
                    value: i.toString(),
                    child: Text(i.toString()),
                  ));
                }
              }
              return snapshot.hasData
                  ? SizedBox(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                'Bank Account',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 20),
                              DropdownButton<String>(
                                value: acc,
                                style: const TextStyle(color: Colors.white),
                                items: accountsWidget,
                                onChanged: (cur) {
                                  setState(() {
                                    print(acc);
                                    acc = cur!;
                                    print(acc);
                                  });
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '₹',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: TextFormField(
                                    initialValue: 1000.toString(),
                                    onChanged: (s) {
                                      setState(() {
                                        amt = int.parse(s);
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Expanded(child: Container()),
                          Center(
                            child: SizedBox(
                                width: 250,
                                height: 60,
                                child: TextButton(
                                  onPressed: () {
                                    displayDialog(context, "Yes", "No",
                                        () async {
                                      print('Added');
                                      print({
                                        "account": int.parse(acc!),
                                        "amount": amt,
                                        "receiverId": [widget.userData.userID]
                                      });
                                      var res = await makePostRequest(
                                          json.encode({
                                            "account": int.parse(acc!),
                                            "amount": amt,
                                            "receiverId": [
                                              widget.userData.userID
                                            ]
                                          }),
                                          "/funds/transferAmount",
                                          null,
                                          true);
                                      setState(() {
                                        showProgress = false;
                                      });
                                      if (res.statusCode == 200) {
                                        showToast("Payment was successful!");
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
                                      style: TextStyle(
                                          fontSize: 23, color: Colors.white),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)))),
                                )),
                          ),
                        ],
                      ),
                    )
                  : const CircularProgressIndicator();
            }),
      ),
    );
  }
}
