import 'dart:math';
import 'package:flutter_test/src/finders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment_app/widgets/calc_widget.dart';
void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Widget initially has middle values of attributes', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(MaterialApp(home:LoanCalculator(url: 'https://www.axisbank.com/retail/loans/car-loan', LoanName: 'Car',)));
    expect(find.text('1500000'),findsOneWidget);
    expect(find.text('6'),findsOneWidget);
    expect(find.text('7.0'),findsOneWidget);
    expect(find.byType(Slider),findsNWidgets(3));
    expect(find.byType(ElevatedButton),findsNWidgets(2));
    expect(find.text('We help you calculate your EMI'),findsOneWidget);
    }
  );
  testWidgets('Tapping calculate should calculate loan amount', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(MaterialApp(home:LoanCalculator(url: 'https://www.axisbank.com/retail/loans/car-loan', LoanName: 'Car',)));
    //await tester.enterText(find.byType(TextFormField).evaluate().elementAt(0).widget as Finder, '10000000');
    final childFinder = find.byKey(Key('calc'));
    await tester.tap(childFinder);
    await tester.pump();
    expect(find.text('Your monthly EMI will be Rs. 25574'),findsOneWidget);
  }
  );
  testWidgets('Tapping calculate should calculate loan amount', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(MaterialApp(home:LoanCalculator(url: 'https://www.axisbank.com/retail/loans/car-loan', LoanName: 'Car',)));
    //await tester.enterText(find.byType(TextFormField).evaluate().elementAt(0).widget as Finder, '10000000');
    final s1= find.byKey(Key('tf1'));
    final s2= find.byKey(Key('tf2'));
    final s3= find.byKey(Key('tf3'));
    await tester.enterText(s1,'10000000');
    await tester.enterText(s2,'30');
    await tester.enterText(s3,'15.0');
    //await tester.drag(s1,Offset(100,0));
    //await tester.drag(s2,Offset(100,0));
    //await tester.drag(s3,Offset(100,0));
    final childFinder = find.byKey(Key('calc'));
    await tester.tap(childFinder);
    await tester.pump();
    expect(find.text('Your monthly EMI will be Rs. 126444'),findsOneWidget);
  }
  );

}