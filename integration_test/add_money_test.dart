import 'package:flutter_test/src/finders.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment_app/main.dart' as app;
void main(){
  group('App Test',(){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('add money test',(WidgetTester tester) async{
    app.main();
    await  tester.pumpAndSettle();
    final splgn=find.byKey(Key('startpgln'));
    final emaillogin=find.byKey(Key('loginemail'));
    final pwdlogin=find.byKey(Key('loginpwd'));
    final btnlogin=find.byKey(Key('loginbtn'));
    final addcredbtn=find.byKey(Key('addcred'));
    final addmonbtn=find.byKey(Key('addmoneybtn'));
    final ddffsel=find.byKey(Key('ddff1'));
    final addtoaccbtn=find.byKey(Key('addtoaccbtn'));
    final addmbbtn=find.byKey( Key('addcredbackbtn'));
    final pab=find.byKey( Key('posab'));
    final fbbbtn=find.byKey( Key('backff'));
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    await tester.tap(splgn);
    await  tester.pumpAndSettle();
    await tester.enterText(emaillogin,'soorya.s27@gmail.com');
    await tester.enterText(pwdlogin,'Password123!');
    await tester.tap(btnlogin);
    await  tester.pumpAndSettle();
    await tester.tap(addcredbtn);
    await  tester.pumpAndSettle();
    await tester.tap(addmonbtn);
    await  tester.pumpAndSettle();
    await tester.tap(ddffsel);
    await  tester.pumpAndSettle();
    final dropdownItem = find.text('1212121212121212').last;
    await tester.tap(dropdownItem);
    await  tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('amttoadd')), '100');
    await  tester.pumpAndSettle();
    await tester.tap(addtoaccbtn);
    await  tester.pumpAndSettle();
    await tester.tap(pab);
    await  tester.pumpAndSettle();
    await  tester.pumpAndSettle();
    await  tester.pumpAndSettle();
    await  tester.pumpAndSettle();
    //expect(find.text('₹ 34240'),findsOneWidget);
    //await tester.tap(fbbbtn);
    //await  tester.pumpAndSettle();
    //navigator.pop();
    //await  tester.pumpAndSettle();
    //navigator.pop();
    //await  tester.pumpAndSettle();
    });
  });
}