import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: profpage(),
));

class profpage extends StatefulWidget {
  @override
  State<profpage> createState() => _profpage();
}

class _profpage extends State<profpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Center(
              child: CircleAvatar(
                radius:70.0,
              backgroundColor:Colors.blue,
              
              child:Text('S',style: TextStyle(fontSize: 65.0, color: Colors.white,
                letterSpacing: 2.0,),),),

            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                'Shwetha S',

                style: TextStyle(

                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),

            ),
            SizedBox(height: 20,),
            Center(
              child:
              Row(
                children: <Widget>[
                  SizedBox(width: 60.0),
                  Icon(

                    Icons.email,

                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'shwetha28@gmail.com',
                    style: TextStyle(

                      fontSize: 19.0,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),

            ),

            Divider(
              color: Colors.blue,
              height: 60.0,
            ),


            SizedBox(height: 10.0),
            Text(
              'Phone Number :',
              style: TextStyle(
                color: Colors.blue[600],

                fontSize: 22
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '91452360770',
              style: TextStyle(
                fontSize: 19.0,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Current Wallet Account :',
              style: TextStyle(
                  color: Colors.blue[600],

                  fontSize: 22
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '91452360770',
              style: TextStyle(
                fontSize: 19.0,
                letterSpacing: 1.0,

              ),
            ),
            SizedBox(height: 30.0),
          Expanded(

              child:
          Column(
            children: [
              Center(child: ElevatedButton(onPressed: (){}, child:Text("ADD ACCOUNT / CHANGE DEFAULT ACCOUNT", style:TextStyle(fontSize: 15)),
              ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Row(
                  children: [
                    Expanded(flex:5,child:
                    ElevatedButton(onPressed: (){}, child:Center(child: Text("CHANGE PASSWORD", style:TextStyle(fontSize: 14))),
                    ),),
                    SizedBox(width: 10,),
                    Expanded(flex:5,child:
                    ElevatedButton(onPressed: (){}, child:Text("CHANGE PHONE NO.", style:TextStyle(fontSize: 14)),
                    ),),
                  ],
                ),
              ),

            ],
          )
          )
          ],

          ),

      ),


    );
  }
}