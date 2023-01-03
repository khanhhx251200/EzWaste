import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/api/local_auth_api.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/key_constant.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/size_config.dart';

class VerifyAuthenticate extends StatefulWidget {
  const VerifyAuthenticate({Key? key}) : super(key: key);

  @override
  State<VerifyAuthenticate> createState() => _VerifyAuthenticateState();
}

class _VerifyAuthenticateState extends State<VerifyAuthenticate> {
  final LocalAuthentication auth = new LocalAuthentication();
  final storage = FlutterSecureStorage();
  bool isLoginByBiometric = false;
  bool isFaceID = false;

  @override
  void initState() {
    checkUsingBiometric();
    super.initState();
  }

  void authenticate(bool isTurnOn) async {
    if (isTurnOn) {
      final authenticated = await LocalAuthApi.authenticate();
      if (authenticated) {
        storage.write(key: KeyConstant.KEY_USING_BIOMETRIC, value: 'true');
        setState(() {
          isLoginByBiometric = isTurnOn;
        });
      }
    }
  }

  checkUsingBiometric() async {
    String? result = await storage.read(key: KeyConstant.KEY_USING_BIOMETRIC);
    if (result != null) {
      setState(() => isLoginByBiometric = result == 'true');
    }
    if (Platform.isIOS) {
      List<BiometricType> availableBiometrics =
          await LocalAuthApi.getBiometrics();
      if (availableBiometrics.contains(BiometricType.face)) {
        setState(() => isFaceID = true);
      }
    }
  }

  closeAuthenticateBiometric(bool val) {
    storage.delete(key: KeyConstant.KEY_USING_BIOMETRIC);
    setState(() => isLoginByBiometric = val);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
              width: 40,
              child: isFaceID
                  ? Image.asset(
                      'assets/icons/face-id.png',
                      height: 40,
                      width: 40,
                      color: isLoginByBiometric ? kPrimaryColor : null,
                    )
                  : Icon(
                      FontAwesomeIcons.fingerprint,
                      size: 24,
                      color: isLoginByBiometric ? kPrimaryColor : null,
                    )),
          SizedBox(width: size14),
          Expanded(
              child: Text(
            isFaceID ? kLoginByFaceID : kLoginByFingerPrint,
            style: TextStyle(
                color: isLoginByBiometric ? kPrimaryColor : kBlackColor,
                fontWeight: FontWeight.w600),
          )),
          SizedBox(width: getProportionateScreenWidth(4)),
          FlutterSwitch(
            width: 48.0,
            height: size24,
            valueFontSize: size32,
            toggleSize: size24,
            borderRadius: 30.0,
            activeColor: kPrimaryColor,
            onToggle: (val) async {
              if (val) {
                authenticate(val);
              } else {
                final result = await showDialogConfirm(context);
                if (result) closeAuthenticateBiometric(val);
              }
            },
            value: isLoginByBiometric,
          ),
        ],
      ),
    );
  }
}
