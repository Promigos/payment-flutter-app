import 'package:flutter/material.dart';
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
                onPressed: () {},
                splashRadius: 20,
                icon: const Icon(
                  Icons.qr_code,
                ))
          ],
        ),
        body: Column(
          children: [
            //TODO: Wallet balance, add funds
            Expanded(
              child: Container(),
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
