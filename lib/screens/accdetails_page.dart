import 'package:flutter/material.dart';
class AccDetails extends StatefulWidget {
  const AccDetails({Key? key}) : super(key: key);

  @override
  _AccDetailsState createState() => _AccDetailsState();
}

class _AccDetailsState extends State<AccDetails> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Add Account'),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
          )),
    ),
    body: SingleChildScrollView(
  child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 50,
        ),

        const Padding(

          padding: EdgeInsets.all(30.0),
          child: Text('ACCOUNT DETAILS',
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
              hintText: 'Enter Account Number',
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Expiry Date',
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter CVV',
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
              'ADD WALLET ACCOUNT',
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
        ),
      ],
    ),
    ),
  );
  }
}
