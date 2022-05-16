import 'package:flutter/material.dart';
import 'package:payment_app/screens/analytics.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:payment_app/screens/LinearSales.dart';
Widget GraphSelect(num){
  if (num == 0){
    return MonthLineChart(_createSampleData(),animate: false);
  }
  else if (num== 1){
    return DailyLineChart(_createDailyData(), animate: false);
  }
  else{
    return YearLineChart(_createYearData(),animate: false);
  }
  return Container();
}
List<charts.Series<MonthData, int>> _createSampleData() {

  final data =[
    new MonthData(5, 0),
    new MonthData(0,1),
    new MonthData(10,2)
  ];

  return [
    new charts.Series<MonthData, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (MonthData m, _) => m.month,
      measureFn: (MonthData m, _) => m.trans,
      data: data,
    )
  ];
}

List<charts.Series<YearData, int>> _createYearData() {

  final data =[
    new YearData(5, 2),
    new YearData(7,1),
    new YearData(10,0)
  ];

  return [
    new charts.Series<YearData, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (YearData y, _) => y.year,
      measureFn: (YearData y, _) => y.trans,
      data: data,
    )
  ];
}

List<charts.Series<DailyData, int>> _createDailyData() {

  final data =[
    new DailyData(5, 2),
    new DailyData(7,1),
    new DailyData(10,0)
  ];

  return [
    new charts.Series<DailyData, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (DailyData y, _) => y.date,
      measureFn: (DailyData y, _) => y.trans,
      data: data,
    )
  ];
}