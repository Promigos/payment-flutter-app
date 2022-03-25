import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocaLAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to unlock',
        biometricOnly: true,
        useErrorDialogs: false,
        stickyAuth: true,
      );
    } on PlatformException catch(e){
      print(e);
      return false;
    }
  }
}