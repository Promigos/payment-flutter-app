import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:payment_app/screens/LinearSales.dart';
class PointsLineChart extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList;
  final bool animate;

  PointsLineChart(this.seriesList, {required this.animate});



  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      behaviors: [
         charts.ChartTitle('Transactions',
            behaviorPosition: charts.BehaviorPosition.bottom,

            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea),
         charts.ChartTitle('Month',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea)
      ],
    );
  }


}
final customTickFormatter =
charts.BasicNumericTickFormatterSpec( (value) {
  if (value == 0) {
    return "Jan";
  } else if (value == 1) {
    return "Feb";
  } else if (value == 2) {
    return "Mar";
  } else if (value == 3) {
    return "Apr";
  } else if (value == 4) {
    return "May";
  } else if (value == 5) {
    return "Jun";
  } else if (value == 6) {
    return "Jul";
  }
  else {return "Mon";}
});

class MonthLineChart extends StatelessWidget {
  final List<charts.Series<MonthData, int>> seriesList;
  final bool animate;

  MonthLineChart(this.seriesList, {required this.animate});



  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList,
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      domainAxis: charts.NumericAxisSpec(
        tickProviderSpec:
        charts.BasicNumericTickProviderSpec(desiredTickCount: 7),
        tickFormatterSpec: customTickFormatter,
      ),
      behaviors: [
        charts.ChartTitle('Transactions',
            behaviorPosition: charts.BehaviorPosition.bottom,

            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Month',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea)
      ],
    );
  }


}
final yearTickFormatter =
charts.BasicNumericTickFormatterSpec( (value) {
  if (value == 0) {
    return "2020";
  } else if (value == 1) {
    return "2021";
  } else if (value == 2) {
    return "2022";
  } else if (value == 3) {
    return "2019";
  } else if (value == 4) {
    return "2018";
  }
  else {
    return "2018";}
});
class YearLineChart extends StatelessWidget {
  final List<charts.Series<YearData, int>> seriesList;
  final bool animate;

  YearLineChart(this.seriesList, {required this.animate});


  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList,
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      domainAxis: charts.NumericAxisSpec(
        tickProviderSpec:
        charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
        tickFormatterSpec: yearTickFormatter,
      ),
      behaviors: [
        charts.ChartTitle('Year',
            behaviorPosition: charts.BehaviorPosition.bottom,

            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Transactions',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea)
      ],
    );
  }


}

final dayTickFormatter =
charts.BasicNumericTickFormatterSpec( (value) {
  value = value! + 1;
  return value.toString();
});
class DailyLineChart extends StatelessWidget {
  final List<charts.Series<DailyData, int>> seriesList;
  final bool animate;

  DailyLineChart(this.seriesList, {required this.animate});


  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList,
      animate: animate,
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      domainAxis: charts.NumericAxisSpec(
        tickProviderSpec:
        charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
        tickFormatterSpec: dayTickFormatter,
      ),
      behaviors: [
        charts.ChartTitle('Date',
            behaviorPosition: charts.BehaviorPosition.bottom,

            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Transactions',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea)
      ],
    );
  }


}

/// Sample linear data type.
