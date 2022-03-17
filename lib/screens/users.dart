import 'package:flutter/material.dart';
import 'package:payment_app/screens/chat_page.dart';

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
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Text(
                    "S",
                  ),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatPage()),
                  );
                },
                title: const Text("User Name"),
                subtitle: const Text("Phone Number"),
                trailing:
                    ElevatedButton(onPressed: () {}, child: const Text("PAY")),
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
