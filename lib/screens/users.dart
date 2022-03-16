import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(4),
            child: Card(
              child: ListTile(
                title: Text("User Name"),
                subtitle: Text("Phone Number"),
              ),
              elevation: 5,
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
