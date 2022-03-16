import 'package:flutter/material.dart';
import 'package:payment_app/screens/scan_qr_page.dart';
import 'package:payment_app/screens/users.dart';
import 'package:payment_app/widgets/home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                onPressed: () {},
                splashRadius: 20,
                icon: const Icon(
                  Icons.logout,
                ))
          ],
        ),
        body: Column(
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
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Balance",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white.withOpacity(0.8))),
                              ),
                              Text("₹ 1000000",
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.yellow.shade500, fontWeight: FontWeight.bold)),
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
                          child: const Text("ADD CREDITS",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(15)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Colors.blue)))),
                          onPressed: () {}),
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
                              onClick: () {}),
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
                              onClick: () {}),
                          HomeCard(
                              title: "Profile",
                              icon: Icons.person,
                              onClick: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ));
  }
}
