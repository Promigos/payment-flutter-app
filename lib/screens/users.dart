import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/screens/chat_page.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../utils/http_modules.dart';

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
      body: FutureBuilder(
          future: makePostRequest(null, "/users", null, true, context: context),
          builder: (context, AsyncSnapshot<http.Response> snapshot) {
            List<UserModel> list = [];
            if (snapshot.hasData) {
              var jsonData = json.decode(snapshot.data!.body);
              for (var i in jsonData) {
                list.add(UserModel(
                    userID: i['userID'],
                    name: i['name'],
                    phoneNumber: i['phone'],
                    email: i['email']));
              }
            }
            return snapshot.hasData
                ? ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                list[index].name[0],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                          userData: list[index],
                                        )),
                              );
                            },
                            title: Text(list[index].name),
                            subtitle: AutoSizeText(
                              list[index].email,
                              maxLines: 1,
                            ),
                            trailing: ElevatedButton(
                                onPressed: () {}, child: const Text("PAY")),
                          ),
                          elevation: 5,
                        ),
                      );
                    },
                    itemCount: list.length,
                  )
                : const CircularProgressIndicator();
          }),
    );
  }
}
