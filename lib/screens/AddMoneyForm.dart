import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

import '../utils/http_modules.dart';
import '../widgets/alert_dialog.dart';

class AddMoneyForm extends StatefulWidget {
  const AddMoneyForm({Key? key}) : super(key: key);

  @override
  _AddMoneyFormState createState() => _AddMoneyFormState();
}

//TODO Add server function to get available bank accounts
class _AddMoneyFormState extends State<AddMoneyForm> {
  int amt = 1000;
  String acc = '';
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: Center(
        child: FutureBuilder(
            future: makePostRequest(null, "/accounts", null, true,
                context: context),
            builder: (context, AsyncSnapshot<http.Response> snapshot) {
              List<DropdownMenuItem<String>> accountsWidget = [];
              if (snapshot.hasData) {
                try {
                  List data = json.decode(snapshot.data!.body)['data'];
                  print(data.isEmpty);
                  if (data.isEmpty) {
                    return const Text("Please add a bank account");
                  }
                  acc = json.decode(snapshot.data!.body)['data'][0].toString();
                  print(json.decode(snapshot.data!.body)['data'][0].toString());
                  for (var i in json.decode(snapshot.data!.body)['data']) {
                    accountsWidget.add(DropdownMenuItem(
                      value: i.toString(),
                      child: Text(i.toString()),
                    ));
                  }
                } catch (e) {
                  return CircularProgressIndicator();
                }
              }
              return snapshot.hasData
                  ? SizedBox(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                                child: Text(
                              'Add Credits',
                              style: TextStyle(fontSize: 32),
                            )),
                          ),
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
                                  print(cur);
                                  setState(() {
                                    print(acc);
                                    acc = cur!;
                                    print(acc);
                                  });
                                },
                              )
                            ],
                          ),
                          // SizedBox(height:30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Amount',
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                  height: 50,
                                  width: 50,
                                  child: TextFormField(
                                    initialValue: amt.toString(),
                                    onChanged: (s) {
                                      setState(() {
                                        amt = int.parse(s);
                                        print(s);
                                        print("AMT");
                                      });
                                    },
                                  ))
                            ],
                          ),
                          // SizedBox(height:30),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: ElevatedButton(
                                onPressed: () {
                                  displayDialog(context, "Yes", "No", () async {
                                    setState(() {
                                      showProgress = true;
                                    });
                                    print(amt);
                                    var res = await makePostRequest(
                                        json.encode({
                                          "account": int.parse(acc),
                                          "amount": amt
                                        }),
                                        "/funds/addFunds",
                                        null,
                                        true);
                                    setState(() {
                                      showProgress = false;
                                    });
                                    if (res.statusCode == 200) {
                                      showToast("Funds successfully added!");
                                      Navigator.pop(context);
                                    } else {
                                      showToast(res.body);
                                    }
                                    Navigator.pop(context);
                                  }, "Add credits?",
                                      "Are you sure you want to add credits to your wallet?");
                                },
                                child: const Center(
                                  child: Text(
                                    "Add to Wallet",
                                  ),
                                ),
                              ),
                            ),
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
