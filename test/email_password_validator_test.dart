import 'package:test/test.dart';
import 'package:payment_app/screens/login_page.dart';
    void main(){
      test('empty email returns error string',(){
        var result=EmailFieldValidator.validate('');
        expect(result,"Email cannot be empty");
      });
      test('non-empty email returns null',(){
        var result=EmailFieldValidator.validate('email');
        expect(result,null);
      });

test('empty password returns error string',(){
var result=PasswordFieldValidator.validate('');
expect(result,"Password cannot be empty");
});
      test('non-empty password returns null',(){
        var result=PasswordFieldValidator.validate('password');
        expect(result,null);
      });
}
