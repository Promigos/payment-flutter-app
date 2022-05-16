import 'package:flutter/material.dart';
import 'package:payment_app/screens/analytics.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:payment_app/screens/LinearSales.dart';
import 'package:payment_app/utils/Graph_Selector.dart';
class AnalyticsMain extends StatelessWidget {
  const AnalyticsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width:300,
          height: 300,
          child: GraphSelect(1) ,
        ),
      ),
    );
  }
}
