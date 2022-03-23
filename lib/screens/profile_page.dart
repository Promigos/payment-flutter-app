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
            const SizedBox(height: 40,),
            const Center(
              child: const CircleAvatar(
                radius:70.0,
                backgroundColor:Colors.blue,

                child:Text('S',style: const TextStyle(fontSize: 65.0, color: Colors.white,
                  letterSpacing: 2.0,),),),

            ),
            const SizedBox(height: 20,),
            const Center(
              child: const Text(
                'Shwetha S',

                style: const TextStyle(

                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),

            ),
            const SizedBox(height: 20,),
            Center(
              child:
              Row(
                children: <Widget>[
                  const SizedBox(width: 60.0),
                  const Icon(

                    Icons.email,

                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    'shwetha28@gmail.com',
                    style: const TextStyle(

                      fontSize: 19.0,
                      letterSpacing: 1.0,
                    ),
                  )
                ],
              ),

            ),

            const Divider(
              color: Colors.blue,
              height: 60.0,
            ),


            const SizedBox(height: 10.0),
            Text(
              'Phone Number :',
              style: TextStyle(
                  color: Colors.blue[600],

                  fontSize: 22
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              '91452360770',
              style: TextStyle(
                fontSize: 19.0,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Current Wallet Account :',
              style: TextStyle(
                  color: Colors.blue[600],

                  fontSize: 22
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              '91452360770',
              style: const TextStyle(
                fontSize: 19.0,
                letterSpacing: 1.0,

              ),
            ),
            const SizedBox(height: 30.0),
            Expanded(

                child:
                Column(
                  children: [
                    Center(child: ElevatedButton(onPressed: (){}, child:const Text("ADD ACCOUNT / CHANGE DEFAULT ACCOUNT", style:const TextStyle(fontSize: 15)),
                    ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      child: Row(
                        children: [
                          Expanded(flex:5,child:
                          ElevatedButton(onPressed: (){}, child:const Center(child: Text("CHANGE PASSWORD", style:const TextStyle(fontSize: 14))),
                          ),),
                          const SizedBox(width: 10,),
                          Expanded(flex:5,child:
                          ElevatedButton(onPressed: (){}, child:const Text("CHANGE PHONE NO.", style:const TextStyle(fontSize: 14)),
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