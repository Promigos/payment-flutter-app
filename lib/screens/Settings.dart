
import 'package:flutter/material.dart';
import 'dart:convert';
int RecommendedWalletBalance = 1000;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_balance_wallet_rounded),
            title: Text('Recommended Wallet Balance'),
            trailing: TextFormField(
              initialValue: RecommendedWalletBalance.toString(),
              onChanged: (String s) {
                setState(() {
                  RecommendedWalletBalance = int.parse(s);
                });
              }

            ),
          )
        ],
      ),
    );
  }
}
