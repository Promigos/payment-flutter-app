import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/screens/sign_up.dart';
import 'package:payment_app/utils/colors.dart' as colors;
import 'package:payment_app/utils/constants.dart' as constants;
import 'package:payment_app/screens/login_page.dart';


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(), flex: 8,),
              Expanded(child: Text('Welcome to\nAPP NAME', style: GoogleFonts.nunito(fontSize: 35, fontWeight: FontWeight.bold,),),flex: 3,),
              SizedBox(height: 20,),
              Expanded(child: Text('Add some catch phrase', style: TextStyle(),)),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(),
                    onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUp()));
                  }, child: Text('SIGN UP',)),
                  const SizedBox(width: 20,),
                  ElevatedButton(style: ElevatedButton.styleFrom(), onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage()));
                  }, child: Text('LOG IN', ))
                ],
              ), flex: 12,)
            ],
          ),
        ),
      ),
    );
  }
}