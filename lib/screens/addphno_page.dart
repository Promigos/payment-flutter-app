import 'package:flutter/material.dart';
class ChangePhNo extends StatefulWidget {
  const ChangePhNo({Key? key}) : super(key: key);

  @override
  _ChangePhNoState createState() => _ChangePhNoState();
}

class _ChangePhNoState extends State<ChangePhNo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          const SizedBox(
          height: 50,
    ),

    const Padding(

    padding: EdgeInsets.all(30.0),
    child: Text('CHANGE PHONE NUMBER',
    style: TextStyle(
    fontSize: 20,
    letterSpacing: 1.5,
    fontWeight: FontWeight.bold)),
    ),
    const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter new phone number',
    ),
    ),
    ),
    const SizedBox(
    height: 20,
    ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'SAVE CHANGES',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ],
          ),
    );
  }
}
