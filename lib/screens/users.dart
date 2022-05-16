import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/screens/add_users.dart';
import 'package:payment_app/screens/chat_page.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/screens/split_money.dart';
import 'package:payment_app/screens/unblock_users.dart';
import '../models/user_model.dart';
import '../utils/http_modules.dart';
import 'Transaction.dart';
import 'package:contacts_service/contacts_service.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SplitMoney()),
              );
            },
            icon: const Icon(Icons.group_add),
            splashRadius: 20,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UnblockUsers()),
              );
            },
            icon: const Icon(Icons.person_add_disabled),
            splashRadius: 20,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddUsers()),
              );
            },
            icon: const Icon(Icons.supervised_user_circle_outlined),
            splashRadius: 20,
          )
        ],
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
              try {
                var jsonData = json.decode(snapshot.data!.body);
                for (var i in jsonData) {
                  list.add(UserModel(
                      userID: i['userID'],
                      name: i['name'],
                      phoneNumber: i['phone'],
                      email: i['email']));
                }
                if (list.isEmpty) {
                  return const Center(child: Text("No users found"));
                }
              } catch (e) {
                return const Center(child: CircularProgressIndicator());
              }
            }
            return snapshot.hasData
                ? ListWidget(
                    list: list,
                  )
                : Center(child: const CircularProgressIndicator());
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

class ListWidget extends StatefulWidget {
  ListWidget({Key? key, required this.list}) : super(key: key);

  List<UserModel> list;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late List<UserModel> list;

  @override
  void initState() {
    list = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (data) {
              setState(() {
                list = widget.list
                    .where((element) =>
                        element.name.toLowerCase().contains(data.toLowerCase()))
                    .toList();
              });
            },
            decoration: const InputDecoration(
                hintText: 'Search for users',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
        Expanded(
          child: list.isNotEmpty
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Transaction(
                                            userData: list[index],
                                          )),
                                );
                              },
                              child: const Text("PAY")),
                        ),
                        elevation: 5,
                      ),
                    );
                  },
                  itemCount: list.length,
                )
              : const Center(
                  child: Text("No users found"),
                ),
        )
      ],
    );
  }
}
