import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'AddMoneyForm.dart';
class Alert extends StatelessWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Money'),
      content: Form(
        child: TextFormField(
          onChanged: (s){print(s);},
        )
      ),
    );
  }
}

Color chooseColor(amt,thresh){
  Color color;
  if (amt < thresh/2){
    color = Colors.red;
  }
  else if(amt < thresh){
    color = Colors.deepOrange;
  }
  else{
    color = Colors.green;
  }
  return color;
}
class AddMoney extends StatefulWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  _AddMoneyState createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  @override
  Color ?color;
  int amt =5000;
  int thresh = 6000;
  void initState() {
    super.initState();
    setState(() {
      color = chooseColor(amt,thresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,height: 10,),
                  Container(
                    height: 80.0,
                    width: 80.0,
                    child: FittedBox(
                      child: FloatingActionButton(onPressed: (){

                      }, child: Icon(Icons.arrow_back_rounded,color: Colors.white,),backgroundColor: color,),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 150),
              CircularPercentIndicator(
                radius: 270.0,
                lineWidth: 20.0,
                percent: 0.6,
                center: new Text("Rs 6000",
                    style: TextStyle(fontSize: 40, color: color)),
                progressColor: color,
                animation: true,
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 250,
                      height: 60,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMoneyForm()));
                          },

                        child: Center(
                          child: Text(
                            "Add Money",
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all<Color>(color!),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
                        ),
                      )),
                ],
              )
            ]),
      ),
    );
  }
}
