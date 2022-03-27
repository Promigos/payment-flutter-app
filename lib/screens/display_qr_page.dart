import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/utils/utils.dart';

import '../utils/http_modules.dart';

class DisplayUserQR extends StatefulWidget {
  const DisplayUserQR({Key? key}) : super(key: key);

  @override
  State<DisplayUserQR> createState() => _DisplayUserQRState();
}

class _DisplayUserQRState extends State<DisplayUserQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('QR Code'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            )),
      ),
      body: FutureBuilder(
        future: makePostRequest(null, "/qr", null, true, context: context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            if(snapshot.data.statusCode == 200) {
              return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Scan QR to add user",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: SvgPicture.string(
                    snapshot.data.body,
                    width: 250,
                  ),
                ),
                Container()
              ],
            );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
