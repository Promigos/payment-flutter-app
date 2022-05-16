import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:oktoast/oktoast.dart';

class SendTechnicalMail extends StatefulWidget {
  const SendTechnicalMail({Key? key}) : super(key: key);

  @override
  State<SendTechnicalMail> createState() => _SendTechnicalMailState();
}

class _SendTechnicalMailState extends State<SendTechnicalMail> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _queryController = TextEditingController();

  clearFieldContent() {
    _nameController.clear();
    _queryController.clear();
  }

  Future<void> sendEmail() async {
    final Email email = Email(
      body: _queryController.text,
      subject: "Technical Query/Suggestions from ${_nameController.text}",
      recipients: ["promigos.enterprise@gmail.com"],
      isHTML: false,
    );

    FlutterEmailSender.send(email)
        .then((value) => clearFieldContent())
        .catchError((e) {
      showToast("Unable to send your query, please try again later!");
    });
  }

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
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Technical Queries',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 30),
                  child: Text(
                    "Have any technical queries, hit us up and we'll get back to you",
                    style: TextStyle(
                        fontSize: 15,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _nameController,
                      style: const TextStyle(
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: const Text('Name',
                            style: TextStyle(
                                fontSize: 12)),
                        filled: true,
                        hintText: 'Enter your name',
                        hintStyle: const TextStyle(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.circular(5)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _queryController,
                      style: const TextStyle(
                          ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter your query";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: const Text('Query',
                            style: TextStyle(
                                fontSize: 12)),
                        filled: true,
                        hintText: 'Enter your query',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.circular(5)),
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!
                            .validate()) {
                          sendEmail();
                        }
                      },
                      child: const Text(
                        "SEND",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
