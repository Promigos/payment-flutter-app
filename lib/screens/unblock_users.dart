import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import '../models/user_model.dart';
import '../utils/http_modules.dart';

class UnblockUsers extends StatefulWidget {
  const UnblockUsers({Key? key}) : super(key: key);

  @override
  State<UnblockUsers> createState() => _UnblockUsersState();
}

class _UnblockUsersState extends State<UnblockUsers> {
  late List<UserModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unblock Users"),
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
          future: makePostRequest(null, "/block/getBlockList", null, true,
              context: context),
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
                          title: Text(list[index].name),
                          subtitle: AutoSizeText(
                            list[index].email,
                            maxLines: 1,
                          ),
                          trailing: ElevatedButton(
                              onPressed: () async {
                                //TODO: Add user here
                                http.Response res = await makePostRequest(
                                    json.encode(
                                        {"receiverID": list[index].userID}),
                                    "/block/unblock",
                                    null,
                                    true,
                                    context: context);

                                showToast(json.decode(res.body)["message"]);
                                if (res.statusCode == 200) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text("Unblock")),
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
