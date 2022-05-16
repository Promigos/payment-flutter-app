import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:payment_app/utils/utils.dart';

class ChangePhNo extends StatefulWidget {
  const ChangePhNo({Key? key}) : super(key: key);

  @override
  _ChangePhNoState createState() => _ChangePhNoState();
}

class _ChangePhNoState extends State<ChangePhNo> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Phone Number'),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Text('CHANGE PHONE NUMBER',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter new phone number',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, bottom: 50, top: 4),
              child: ElevatedButton(
                onPressed: () {
                  showToast("Enter OTP");
                },
                child: const Text(
                  'GENERATE OTP',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              maxLength: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter OTP',
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, bottom: 50, top: 4),
              child: ElevatedButton(
                onPressed: () {
                  showToast("Changed successfully!");
                  setPhoneNumber = controller.text;
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'SAVE CHANGES',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
