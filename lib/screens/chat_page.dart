import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    messages.add(

        //TODO: Remove test data after implementing backend logic
        ChatModel(message: "HEY", date: "", sender: "MY_ID", receiver: ""));
    messages.add(
        ChatModel(message: "Hello", date: "", sender: "", receiver: "MY_ID"));
    messages.add(ChatModel(
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        date: "",
        sender: "MY_ID",
        receiver: ""));

    messages.add(ChatModel(
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        date: "",
        sender: "",
        receiver: "MY_ID"));
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
              children: const [
                CircleAvatar(
                  child: Text(
                    "S",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: AutoSizeText('Soorya'),
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
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Block User",
                ),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                return messages[index].messageWidget;
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
                  onPressed: () {},
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
                              contentPadding: const EdgeInsets.only(top: 15),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.send),
                                splashRadius: 20,
                                onPressed: () {
                                  String message = _controller.text;
                                  if (message.isNotEmpty) {
                                    setState(() {
                                      messages.add(ChatModel(
                                          message: message,
                                          date: "date",
                                          sender: "MY_ID",
                                          receiver: ""));
                                      _controller.clear();
                                    });
                                    _scrollToBottom();
                                  }
                                },
                              ),
                              hintStyle: const TextStyle(color: Colors.black54),
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
      ),
    );
  }
}
