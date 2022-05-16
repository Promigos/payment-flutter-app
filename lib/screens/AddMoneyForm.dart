import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/screens/add_money.dart';
import '../utils/http_modules.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/dropdown_widget.dart';
import 'home_page.dart';
class AmountFieldValidator{
  static String? validate(String value){
    if (int.parse(value) <=0) {
      return "Amount added should be postitive!";
    } else if (double.tryParse(value) != null){
      return null;
    }
    else{
      return "Only numbers allowed in phone number";
    }
  }
}

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
  bool alreadyLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Credits'),
        leading: IconButton(
            key:Key('addcredbackbtn'),
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
            future: !alreadyLoaded
                ? makePostRequest(null, "/accounts", null, true,
                context: context)
                : null,
            builder: (context, AsyncSnapshot<http.Response> snapshot) {
              List data = [];
              if (snapshot.hasData) {
                try {
                  data = json.decode(snapshot.data!.body)['data'];
                  if (data.isEmpty) {
                    return const Text("Please add a bank account");
                  }
                } catch (e) {
                  return Center(child: CircularProgressIndicator());
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: DropDownFormField(
                        key:Key('ddff1'),
                        list: data,
                        onChange: (data) {
                          acc = data;
                          print(acc);
                        },
                        hint: "Select account",
                        title: "Accounts",
                      ),
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
                              key:Key('amttoadd'),
                              initialValue: amt.toString(),
                              validator: (value) => AmountFieldValidator.validate(value!),
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
                          key:Key('addtoaccbtn'),
                          onPressed: () {
                            if (acc.isEmpty) {
                              showToast("Please select an account");
                              return;
                            }
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
                                  true, context: context);
                              setState(() {
                                showProgress = false;
                              });
                              if (res.statusCode == 200) {
                                showToast("Credits added successfully!");
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                        (Route<dynamic> route) => false);
                                    } else {
                                showToast(res.body);
                                }
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                      (Route<dynamic> route) => false);
                                    //Navigator.pop(context);
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
                  : const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
