import 'package:flutter/material.dart';
import 'dart:convert';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int RecommendedWalletBalance = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
      SizedBox(height: 50,),

      Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [

              Icon(Icons.account_balance_wallet_rounded, color: Colors.black,size:40),
              Container(
                width: 100,
                child: TextFormField(
                    initialValue: RecommendedWalletBalance.toString(),
                    onChanged: (String s) {
                      setState(() {
                        RecommendedWalletBalance = int.parse(s);
                      });
                    }),
              )

            ],
          )
        ],
      ),
    );
  }
}
