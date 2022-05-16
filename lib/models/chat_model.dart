import 'package:flutter/material.dart';
import 'package:payment_app/utils/utils.dart';

class ChatModel {
  String message;
  String date;
  String sender;
  String receiver;
  String messageType;

  messageWidget(id) {
    if (messageType != "text") {
      if (sender == id) {
        return Container(
          padding:
              const EdgeInsets.only(left: 50, right: 14, top: 10, bottom: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.blue.shade200,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "payment",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SelectableText(
                      "₹ ${message}",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container(
          padding:
              const EdgeInsets.only(left: 14, right: 50, top: 10, bottom: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "payment",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SelectableText(
                      "₹ ${message}",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      if (sender == id) {
        return Container(
          padding:
              const EdgeInsets.only(left: 50, right: 14, top: 10, bottom: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.grey.shade200,
              ),
              padding: const EdgeInsets.all(16),
              child: SelectableText(
                message,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        );
      } else {
        return Container(
          padding:
              const EdgeInsets.only(left: 14, right: 50, top: 10, bottom: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.blue[200],
              ),
              padding: const EdgeInsets.all(16),
              child: SelectableText(
                message,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        );
      }
    }
  }

  get toJson {
    return {};
  }

  ChatModel(
      {required this.message,
      required this.date,
      required this.sender,
      required this.receiver,
      required this.messageType});
}
