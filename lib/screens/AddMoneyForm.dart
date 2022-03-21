import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AddMoneyForm extends StatefulWidget {
  const AddMoneyForm({Key? key}) : super(key: key);

  @override
  _AddMoneyFormState createState() => _AddMoneyFormState();
}

class _AddMoneyFormState extends State<AddMoneyForm> {
  @override
  Widget build(BuildContext context) {
    var acc;
    var amt;
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text('abc')
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text('Bank Account'),
                  DropdownButton<String>(
                    value:acc,
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (cur) {setState(() {
                      acc = cur;
                    });},
                  )
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Text('Amount:'),
            //     TextFormField(
            //       initialValue:'Enter Amount',
            //       onChanged:(cur){setState(() {
            //         amt = int.parse(cur);
            //       });},
            //       keyboardType: TextInputType.number,
            //       inputFormatters: <TextInputFormatter>[
            //         FilteringTextInputFormatter.digitsOnly
            //       ],
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
