import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import '../models/user_model.dart';
import '../utils/http_modules.dart';
import 'TransactionMultiple.dart';

class SplitMoney extends StatefulWidget {
  const SplitMoney({Key? key}) : super(key: key);

  @override
  State<SplitMoney> createState() => _SplitMoneyState();
}

class _SplitMoneyState extends State<SplitMoney> {

  List<UserModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Pay'),
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
            list.clear();
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
                : const Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List<UserModel> listOfSelectedUsers = [];
          for(var i in list){
            if(i.isChecked){
              listOfSelectedUsers.add(i);
            }
          }

          if(listOfSelectedUsers.isEmpty){
            showToast("Please select at least one user");
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TransactionMultiple(
                  userData: listOfSelectedUsers,
                )),
          );

          for(var i in list){
            i.isChecked = false;
          }
          setState(() {
          });

        },
        label: const Text("Pay"),
        icon: const Icon(Icons.payment),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key, required this.list}) : super(key: key);

  final List<UserModel> list;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: CheckboxListTile(
                dense: true,
                //font change
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text(
                          widget.list[index].name[0],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.list[index].name,
                                style: const TextStyle(fontSize: 16, letterSpacing: 0.5),
                              ),
                              AutoSizeText(widget.list[index].email, overflow: TextOverflow.ellipsis, maxFontSize: 12,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                value: widget.list[index].isChecked,
                onChanged: (val) {
                  setState(() {
                    print(val);
                    widget.list[index].isChecked = val!;
                  });
                }),
          );
        });
  }
}
