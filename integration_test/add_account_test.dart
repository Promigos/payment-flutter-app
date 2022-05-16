import 'package:flutter_test/src/finders.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment_app/main.dart' as app;
void main(){
  group('App Test',(){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('add account test',(WidgetTester tester) async{
      app.main();
      await  tester.pumpAndSettle();
      final splgn=find.byKey(Key('startpgln'));
      final emaillogin=find.byKey(Key('loginemail'));
      final pwdlogin=find.byKey(Key('loginpwd'));
      final btnlogin=find.byKey(Key('loginbtn'));
      final addacc=find.byKey(Key('addacc'));
      final profile=find.byKey(Key('profilepg'));
      final fabaddacc=find.byKey(Key('fabaddacc'));
      final ean=find.byKey(Key('ean'));
      final eed=find.byKey( Key('eed'));
      final cvv=find.byKey( Key('cvv'));
      final ebaa=find.byKey( Key('ebaa'));
      final bkp=find.byKey( Key('bkp'));
      final NavigatorState navigator = tester.state(find.byType(Navigator));
      await tester.tap(splgn);
      await  tester.pumpAndSettle();
      await tester.enterText(emaillogin,'soorya.s27@gmail.com');
      await tester.enterText(pwdlogin,'Password123!');
      await tester.tap(btnlogin);
      await  tester.pumpAndSettle();
      await tester.tap(profile);
      await  tester.pumpAndSettle();
      await tester.tap(addacc);
      await  tester.pumpAndSettle();
      await tester.tap(fabaddacc);
      await  tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key('ean')), '7574747474747474');
      await tester.enterText(find.byKey(Key('eed')), '2348');
      await tester.enterText(find.byKey(Key('cvv')), '077');
      await tester.tap(ebaa);
      await  tester.pumpAndSettle();
      await  tester.pumpAndSettle();
      expect(find.text('7574747474747474'),findsOneWidget);
      await  tester.pumpAndSettle();
    });
  });
}
