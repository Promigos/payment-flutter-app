import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:contacts_service/contacts_service.dart';
class Transaction extends StatefulWidget {
  Transaction({Key? key}) : super(key: key);
  String acc='A';
  @override
  _TransactionState createState() => _TransactionState();
}
//TODO Add server function to get available bank accounts
class _TransactionState extends State<Transaction> {
  @override
  void initState() async{
    List<Contact> contacts = await ContactsService.getContacts();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    var amt;
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: Text('Add Money',style: TextStyle(fontSize:32),)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Text('Person',style: TextStyle(fontSize: 20),),
                  SizedBox(width:20),
                  DropdownButton<String>(
                    value:widget.acc,

                    style: TextStyle(color: Colors.white),
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {

                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (cur) {setState(() {
                      print(widget.acc);
                      widget.acc = cur!;
                      print(widget.acc);
                    });},
                  )                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Text('Bank Account',style: TextStyle(fontSize: 20),),
                  SizedBox(width:20),
                  DropdownButton<String>(
                    value:widget.acc,

                    style: TextStyle(color: Colors.white),
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {

                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (cur) {setState(() {
                      print(widget.acc);
                      widget.acc = cur!;
                      print(widget.acc);
                    });},
                  )
                ],
              ),
              // SizedBox(height:30),
              Row(mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('Amount',style: TextStyle(fontSize: 20),),
                  SizedBox(width:20),
                  Container(
                      height: 50,
                      width: 50,
                      child: TextFormField(
                        initialValue: 1000.toString(),
                        onChanged: (s){
                          setState(() {
                            amt = int.parse(s);
                          });

                        },
                      )
                  )

                ],
              ),
              // SizedBox(height:30),
              Center(
                child: SizedBox(
                    width: 250,
                    height: 60,
                    child: TextButton(
                      onPressed: () {

                        print('Added');
                        Navigator.pop(context);
                      },

                      child: Center(
                        child: Text(
                          "Add to Wallet",
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all<Color>(Colors.green  ),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
