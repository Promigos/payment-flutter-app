import 'package:flutter_test/src/finders.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment_app/main.dart' as app;
void main(){
  group('App Test',(){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('logout test',(WidgetTester tester) async{
      app.main();
      await  tester.pumpAndSettle();
      final splgn=find.byKey(Key('startpgln'));
      final emaillogin=find.byKey(Key('loginemail'));
      final pwdlogin=find.byKey(Key('loginpwd'));
      final btnlogin=find.byKey(Key('loginbtn'));
      final addcredbtn=find.byKey(Key('addcred'));
      final addmonbtn=find.byKey(Key('addmoneybtn'));
      final ddffsel=find.byKey(Key('ddff1'));
      final pab=find.byKey( Key('posab'));
      final unlockpwd=find.byKey(Key('unlockpwd'));
      final unlockpwdbtn=find.byKey(Key('unlockbtn'));
      final lg=find.byKey(Key('logout'));
      final nab=find.byKey( Key('negab'));
      await tester.tap(splgn);
      await  tester.pumpAndSettle();
      await tester.enterText(emaillogin,'soorya.s27@gmail.com');
      await tester.enterText(pwdlogin,'Password123!');
      await tester.tap(btnlogin);
      await  tester.pumpAndSettle();
      await tester.tap(lg);
      await  tester.pumpAndSettle();
      await tester.tap(nab);
      await  tester.pumpAndSettle();
      await tester.tap(lg);
      await  tester.pumpAndSettle();
      expect(find.byType(IconButton),findsNWidgets(3));;
      await tester.tap(pab);
      await  tester.pumpAndSettle();
      expect(find.text('Welcome to\nWALLET UP'),findsOneWidget);

    });
  });
}