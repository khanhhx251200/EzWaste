import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> hasBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      final iosStrings = const IOSAuthMessages(
          cancelButton: 'cancel',
          goToSettingsButton: 'settings',
          goToSettingsDescription: 'Please set up your Touch ID.',
          lockOut: 'Please reenable your Touch ID');
      final androidStrings = const AndroidAuthMessages(
          cancelButton: 'cancel',
          goToSettingsButton: 'settings',
          goToSettingsDescription: 'Please set up your Touch ID.',);

      final authenticated = await _auth.authenticate(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
          iOSAuthStrings: iosStrings,
          androidAuthStrings: androidStrings,
          localizedReason: 'Bật sinh trắc học để đăng nhập dễ dàng hơn');
      return authenticated;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
