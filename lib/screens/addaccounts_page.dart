import 'package:flutter/material.dart';
import 'package:payment_app/screens/accdetails_page.dart';
class AddAccounts extends StatefulWidget {
  const AddAccounts({Key? key}) : super(key: key);

  @override
  _AddAccountsState createState() => _AddAccountsState();
}
List acno=['1230','2345'];

class _AddAccountsState extends State<AddAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Card(
              child: ListTile(
                onTap: (){},
                title: const Text("AccountNumber"),


              ),
              elevation: 5,
            ),
          );
        },
        itemCount: 2,

      ),
floatingActionButton: new FloatingActionButton.extended(onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AccDetails()));},
  icon: Icon(Icons.add),
  label: Text('Add Account'),
  tooltip: 'Click to Add',
  foregroundColor: Colors.white,
  backgroundColor: Colors.lightBlueAccent,
  focusColor: Colors.blue,
  hoverColor: Colors.white,
  elevation: 6,
  hoverElevation: 20,
  splashColor: Colors.blueGrey,
  highlightElevation: 20,
),
    );
  }
}

