import 'package:flutter/material.dart';
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
                        children: const [
                          HomeCard(title: "Users", icon: Icons.supervisor_account_sharp,),
                          HomeCard(title: "Calculator", icon: Icons.calculate_outlined,),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          HomeCard(title: "Analytics", icon: Icons.analytics,),
                          HomeCard(title: "Profile", icon: Icons.person,),
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

// ListView.builder(
// itemBuilder: (BuildContext context, int index) {
// return const Padding(
// padding: EdgeInsets.all(4),
// child: Card(
// child: ListTile(
// title: Text("User Name"),
// subtitle: Text("Phone Number"),
// ),
// elevation: 10,
// ),
// );
// },
// itemCount: 10,
// ),
