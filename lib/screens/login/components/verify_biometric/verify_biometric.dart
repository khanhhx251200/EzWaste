import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/core/api/local_auth_api.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/key_constant.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/helper/ToastUtils.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/action_box.dart';
import 'package:recycle_app/size_config.dart';

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
    return body();
  }

  body() {
    return Row(
      children: [ Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: kBackgroundGreyColor,
            borderRadius: BorderRadius.all(Radius.circular(size16)),
          ),
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
          ),
        ),
        SizedBox(
          width: size16,
        ),
        Expanded(child: Text(isFaceID ? kLoginByFaceID : kLoginByFingerPrint)),
        FlutterSwitch(
          width: size40,
          height: size24,
          valueFontSize: size24,
          toggleSize: size18,
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
        )
      ],
    );
  }
}
