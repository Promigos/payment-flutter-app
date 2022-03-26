import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/models/chat_model.dart';
import 'package:payment_app/models/user_model.dart';
import 'package:payment_app/screens/Transaction.dart';
import 'package:http/http.dart' as http;

import '../utils/http_modules.dart';
import '../utils/utils.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.userData}) : super(key: key);

  final UserModel userData;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> messages = [];
  late Timer _timer;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  _scrollToBottom() {
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 1000,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  child: Text(
                    "S",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: AutoSizeText(widget.userData.name),
                ),
              ],
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            //don't specify icon if you want 3 dot menu
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: const Text(
                  "Block User",
                ),
                onTap: () async {
                  var res = await makePostRequest(
                      json.encode({"receiverID": widget.userData.userID}),
                      "/block",
                      null,
                      true);

                  if (res.statusCode == 200) {
                    showToast("Blocked user successfully!");
                    Navigator.of(context).pop();
                  } else {
                    showToast("Could not block user!");
                  }
                },
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "View Profile",
                ),
              ),
            ],
            onSelected: (item) => {print(item)},
          ),
        ],
      ),
      body: FutureBuilder(
          future: makePostRequest(
              json.encode({"receiverID": widget.userData.userID}),
              "/chats/getChats",
              null,
              true,
              context: context),
          builder: (context, AsyncSnapshot<http.Response> res) {
            if (res.hasData) {
              print(res.data!.body);
              if (res.data?.statusCode != 200) {
                return const Center(
                  child: Text("Could not load chats!"),
                );
              }
              messages.clear();
              for (var i in json.decode(res.data!.body)) {
                print(i);
                messages.add(ChatModel(
                    message: i['message'],
                    date: i['time'].toString(),
                    sender: i['senderID'],
                    receiver: i['receiverID'],
                    messageType: i['messageType'] ?? "text"));
              }
            }
            return res.hasData
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: messages.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: getUserId,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                print(snapshot.data);
                                return snapshot.hasData
                                    ? messages[index]
                                        .messageWidget(snapshot.data)
                                    : Container();
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton.extended(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Transaction(
                                            userData: widget.userData,
                                          )),
                                );
                              },
                              label: const Text("Pay"),
                              icon: const Icon(Icons.payment),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: TextField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                          hintText: "Send message...",
                                          contentPadding:
                                              const EdgeInsets.only(top: 15),
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.send),
                                            splashRadius: 20,
                                            onPressed: () async {
                                              String message = _controller.text;
                                              if (message.isNotEmpty) {
                                                await makePostRequest(
                                                    json.encode({
                                                      "receiverID": widget
                                                          .userData.userID,
                                                      "message": message
                                                    }),
                                                    "/chats/addChats",
                                                    null,
                                                    true,
                                                    context: context);

                                                setState(() {
                                                  _controller.clear();
                                                });
                                                _scrollToBottom();
                                              }
                                            },
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Colors.black54),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : const CircularProgressIndicator();
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
