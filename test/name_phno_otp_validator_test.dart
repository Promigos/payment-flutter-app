import 'package:test/test.dart';
import 'package:payment_app/screens/sign_up.dart';
import 'package:payment_app/screens/login_page.dart';
void main(){
  test('empty name returns error string',(){
    var result=NameFieldValidator.validate('');
    expect(result,"Please enter a valid name");
  });
  test('name with numbers and special characters return error',(){
    var result=NameFieldValidator.validate('var123');
    expect(result,"Only alphabets allowed in name");
  }
    );
  test('non-empty name with alphabet returns null',(){
    var result=NameFieldValidator.validate('name');
    expect(result,null);
  });
  test('empty phone number returns error string',(){
    var result=PhoneNumberFieldValidator.validate('');
    expect(result,"Please enter a valid phone number");
  });
  test('numerical phone number returns null',(){
    var result=PhoneNumberFieldValidator.validate('9654125873');
    expect(result,null);
  });
  test('non-numerical phone number returns error',(){
    var result=PhoneNumberFieldValidator.validate('phoneno');
    expect(result,"Only numbers allowed in phone number");
  });
  test('empty otp returns error string',(){
    var result=OTPFieldValidator.validate('');
    expect(result,"Enter OTP");
  });
  test('numerical otp returns null',(){
    var result=OTPFieldValidator.validate('514412');
    expect(result,null);
  });
  test('non-numerical otp returns error',(){
    var result=OTPFieldValidator.validate('otp');
    expect(result,"Only numbers allowed in OTP");
  });

}
