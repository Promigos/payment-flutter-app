import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:payment_app/models/user_model.dart';
import 'package:payment_app/screens/Transaction.dart';
import 'package:payment_app/screens/chat_page.dart';
import 'package:http/http.dart' as http;

import '../utils/http_modules.dart';

class QRCodeResult extends StatelessWidget {
  const QRCodeResult({Key? key, required this.token}) : super(key: key);

  final String? token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: FutureBuilder(
        future: makePostRequest(
            json.encode({"token": token}), "/addUserQR", null, true,
            context: context),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data?.body);
            if (snapshot.data!.statusCode != 200) {
              return Center(child: Text("Something went wrong!"));
            }
            var data = json.decode(snapshot.data!.body);
            print(data);
            return snapshot.hasData
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Center(
                          child: Text(
                        "Text or pay ${data["userName"]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 26),
                      )),
                      Center(
                          child: Text("${data["phoneNumber"]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7),
                              ))),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 40),
                        child: SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Transaction(
                                              userData: UserModel(
                                                  name: data["userName"],
                                                  userID: data["id"],
                                                  email: data["email"],
                                                  phoneNumber:
                                                      data["phoneNumber"]),
                                            )),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Pay"),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 40),
                        child: SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatPage(
                                              userData: UserModel(
                                                  name: data["userName"],
                                                  userID: data["id"],
                                                  email: data["email"],
                                                  phoneNumber:
                                                      data["phoneNumber"]),
                                            )),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: const Text("Chat"),
                                ))),
                      ),
                      Expanded(child: Container()),
                    ],
                  )
                : const CircularProgressIndicator();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
