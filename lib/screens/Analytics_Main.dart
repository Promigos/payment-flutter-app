import 'package:flutter/material.dart';
import 'package:payment_app/screens/analytics.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:payment_app/screens/LinearSales.dart';
import 'package:payment_app/utils/Graph_Selector.dart';

class AnalyticsMain extends StatefulWidget {
  const AnalyticsMain({Key? key}) : super(key: key);

  @override
  _AnalyticsMainState createState() => _AnalyticsMainState();
}

class _AnalyticsMainState extends State<AnalyticsMain> {
  String dropdownvalue = 'Daily';
  var items = [
    'Daily',
    'Monthly',
    'Yearly',

  ];
  var code = {'Daily':1,"Monthly":0,"Yealy":2};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics")
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SizedBox(height:100),
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue! as String;
                });
              },
            ),
            SizedBox(height: 75,),
            Container(
              width:350,
              height: 300,
              color: Colors.white,
              child: GraphSelect(code[dropdownvalue]) ,
            ),
          ],
        ),
      ),
    );
  }
}

