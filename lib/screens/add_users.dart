import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../utils/http_modules.dart';
import 'package:http/http.dart' as http;

class AddUsers extends StatefulWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  bool isDataValid = false;
  TextEditingController controller = TextEditingController();

  setDataValid(valid) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        isDataValid = valid;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text("Add new user",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Enter phone number to add new user",
                  style: TextStyle(fontSize: 15)),
            ),
            TextFormField(
              controller: controller,
              validator: (data) {
                if (data == null) {
                  setDataValid(false);
                  return "Please enter phone number";
                } else if (data.isEmpty) {
                  setDataValid(false);
                  return "Please enter phone number";
                } else if (data.length != 10) {
                  setDataValid(false);
                  return "Please enter valid phone number";
                }
                setDataValid(true);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "00000 00000",
                prefix: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text("+91"),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                  borderSide: const BorderSide(
                    color: Color(0xff93A0D0),
                    width: 2.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isDataValid
            ? () async {
                //TODO: Add user here
                http.Response res = await makePostRequest(
                    json.encode({"phoneNumber": controller.text}),
                    "/addUserPhone",
                    null,
                    true,
                    context: context);

                showToast(json.decode(res.body)["message"]);
                if (res.statusCode == 200) {
                  Navigator.of(context).pop();
                }
              }
            : null,
        backgroundColor: isDataValid ? Colors.greenAccent : Colors.grey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
