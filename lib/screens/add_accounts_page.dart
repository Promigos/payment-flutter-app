import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:payment_app/screens/accdetails_page.dart';
import 'package:http/http.dart' as http;
import '../utils/http_modules.dart';

class AddAccounts extends StatefulWidget {
  const AddAccounts({Key? key}) : super(key: key);

  @override
  _AddAccountsState createState() => _AddAccountsState();
}

List acno = ['1230', '2345'];

class _AddAccountsState extends State<AddAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
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
          future:
              makePostRequest(null, "/accounts", null, true, context: context),
          builder: (context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasData) {
              try {
                List data = json.decode(snapshot.data!.body)['data'];
                if (data.isEmpty) {
                  return const Center(
                      child: Text(
                          "No accounts found, please add a payment account"));
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text(data[index].toString()),
                        ),
                        elevation: 5,
                      ),
                    );
                  },
                  itemCount: data.length,
                );
              } catch (e) {
                return const Center(
                  child: Text("No accounts found"),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AccDetails()));
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Account'),
        tooltip: 'Click to Add',
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        focusColor: Colors.blue,
        hoverColor: Colors.white,
        elevation: 6,
        hoverElevation: 20,
        splashColor: Colors.blueGrey,
        highlightElevation: 20,
      ),
    );
  }
}
