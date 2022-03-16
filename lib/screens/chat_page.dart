import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text("MESSAGE"),
                    ),
                  );
                }),
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
                        padding: const EdgeInsets.only(
                            left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Send message...",
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.send),
                                splashRadius: 20,
                                onPressed: () {},
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
