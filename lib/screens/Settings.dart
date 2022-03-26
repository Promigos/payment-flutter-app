import 'package:flutter/material.dart';
import 'package:payment_app/utils/utils.dart';
import 'dart:convert';
import 'package:settings_ui/settings_ui.dart';

import 'package:payment_app/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int RecommendedWalletBalance = 1000;
  int threshold = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile(
                title: Text('Recommended Wallet Balance'),
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                ),
                trailing: Container(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    initialValue: RecommendedWalletBalance.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (s) {
                      setState(() {
                        RecommendedWalletBalance = int.parse(s);
                        setRecWalletBal = RecommendedWalletBalance.toString();
                        print(RecommendedWalletBalance);
                      });
                    },
                  ),
                ),
              ),
              SettingsTile(
                title: Text('Revert Threshold'),
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                ),
                trailing: Container(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (s) {
                      setState(() {
                        threshold = int.parse(s);

                        setRevertThreshold = threshold.toString();
                        print(threshold);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
