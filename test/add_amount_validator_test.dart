import 'package:payment_app/screens/AddMoneyForm.dart';
import 'package:test/test.dart';

void main(){
  test('negative amount returns error',(){
    var result=AmountFieldValidator.validate('-55');
    expect(result,"Amount added should be postitive!");
  });
  test('no amount returns error',(){
    var result=AmountFieldValidator.validate('0');
    expect(result,"Amount added should be postitive!");
  });
  test('positive amount returns null',(){
    var result=AmountFieldValidator.validate('65623');
    expect(result,null);
  });


}