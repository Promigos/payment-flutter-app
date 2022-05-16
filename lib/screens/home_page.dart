import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/screens/Settings.dart';
import 'package:payment_app/screens/add_money.dart';
import 'package:payment_app/screens/calculators.dart';
import 'package:payment_app/screens/display_qr_page.dart';
import 'package:payment_app/screens/profile_page.dart';
import 'package:payment_app/screens/scan_qr_page.dart';
import 'package:payment_app/screens/start_page.dart';
import 'package:payment_app/screens/users.dart';
import 'package:payment_app/widgets/home_card.dart';
import 'package:payment_app/utils/colors.dart' as colors;
import 'package:http/http.dart' as http;

import '../utils/http_modules.dart';
import '../utils/utils.dart';
import '../widgets/alert_dialog.dart';
import 'Analytics_Main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  late var balance;

  @override
  void initState() {
    super.initState();
    //TODO: Set firebase token here
    FirebaseMessaging.instance.getToken().then((value) {
      makePostRequest(json.encode({"token": value}), "/setToken", null, true,
              context: context)
          .then((value) => {
                if (value.statusCode != 200)
                  {
                    showToast(
                        "Token update failed! Notifications might not work!"),
                  }
              })
          .catchError((err) {
        showToast(err);
      });
    });
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {});
      print("SET STATE");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRScannerView()),
                  );
                },
                splashRadius: 20,
                icon: const Icon(
                  Icons.qr_code,
                )),
            IconButton(
                onPressed: () {},
                splashRadius: 20,
                icon: const Icon(
                  Icons.settings,
                )),
            IconButton(
              key: Key('logout'),
                onPressed: () {
                  displayDialog(context, "Yes", "No", () {
                    clearAllData();
                    showToast("Signed out successfully!");
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const StartPage()),
                        (Route<dynamic> route) => false);
                  }, "Are you sure you want to sign out?",
                      "You will be signed out and all data will be lost");
                },
                splashRadius: 20,
                icon: const Icon(
                  Icons.logout,
                ))
          ],
        ),
        body: FutureBuilder(
            future: makePostRequest(null, "/funds/getBalance", null, true,
                context: context),
            builder: (context, AsyncSnapshot<http.Response> snapshot) {
              print(snapshot.hasData);
              print(snapshot.error);
              if (!snapshot.hasData) {
                return Center(child: const CircularProgressIndicator());
              } else {
                balance = json.decode(snapshot.data!.body);
                print(balance);
              }
              return Column(
                children: [
                  //TODO: Wallet balance, add funds
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Card(
                                elevation: 10,
                                color: colors.cardColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Balance",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white
                                                  .withOpacity(0.8))),
                                    ),
                                    Text("₹ ${balance['data'].toString()}",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: colors.primaryTextColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: TextButton(
                              key: Key('addcred'),
                                child: const Text("ADD CREDITS",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue)),
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.all(15)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side:
                                                const BorderSide(color: Colors.blue)))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddMoney(
                                                balance:
                                                    balance['data'].toString(),
                                              )));
                                }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                                child: const Text("Get QR Code"),
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.all(15)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Colors.blue)))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DisplayUserQR()));
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //TODO: Calculator, friends list, analytics, profile
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                HomeCard(
                                  title: "Users",
                                  icon: Icons.supervisor_account_sharp,
                                  onClick: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Users()),
                                    );
                                  },
                                ),
                                HomeCard(
                                    title: "Calculator",
                                    icon: Icons.calculate_outlined,
                                    onClick: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CalculatorList()));
                                    }),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                HomeCard(
                                    title: "Analytics",
                                    icon: Icons.analytics,
                                    onClick: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AnalyticsMain()));
                                    }),
                                HomeCard(
                                  key: Key('profilepg'),
                                    title: "Profile",
                                    icon: Icons.person,
                                    onClick: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage()));
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              );
            }));
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
