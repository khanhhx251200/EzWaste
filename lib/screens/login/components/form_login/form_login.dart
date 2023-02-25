import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/components/loading_widget.dart';
import 'package:recycle_app/core/api/local_auth_api.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/key_constant.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/dashboash/dashboash_screen.dart';
import 'package:recycle_app/services/user_service.dart';
import 'package:provider/provider.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final LocalAuthentication auth = new LocalAuthentication();
  final storage = FlutterSecureStorage();
  final UserService _userService = new UserService();

  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool usingBiometric = false;
  bool isFaceID = false;
  bool isLogging = false;
  bool isLoadingLogin = false;

  String? fullName;

  loginAccountAnother() {
    _formKey.currentState!.reset();
    userNameController.text = '';
    storage.deleteAll();
    setState(() {
      usingBiometric = false;
      isLogging = false;
    });
  }

  goToForgotPassword() {
    print('Quên mật khẩu');
  }

  goToHomeScreen() {
    Navigator.pushReplacementNamed(context, DashBoardScreen.routeName);
  }

  validateForm() async {
    print(kSignIn);
    if (_formKey.currentState!.validate()) {
      doLogin(userNameController.text, passwordController.text);
    } else {
      print('not validate');
    }
  }

  doLogin(String userName, String password) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() => isLoadingLogin = true);
    try {
      final userInfo = await _userService.doLogin(userName, password);
      setState(() => isLoadingLogin = false);
      if (userInfo != null) {
        context.read<AuthProvider>().setUserInfo(userInfo);
        goToHomeScreen();
      }
    } catch (e) {
      setState(() => isLoadingLogin = false);
    }
  }

  checkUsingBiometric() async {
    String? result = await storage.read(key: KeyConstant.KEY_USING_BIOMETRIC);
    if (result != null) {
      setState(() => usingBiometric = result == 'true');
    }
    if (Platform.isIOS) {
      List<BiometricType> availableBiometrics =
          await LocalAuthApi.getBiometrics();
      if (availableBiometrics.contains(BiometricType.face)) {
        setState(() => isFaceID = true);
      }
    }
  }

  checkUserLogging() async {
    if (await storage.containsKey(key: KeyConstant.KEY_FULL_NAME) &&
        await storage.containsKey(key: KeyConstant.KEY_USER_NAME)) {
      print('check');
      fullName = (await storage.read(key: KeyConstant.KEY_FULL_NAME));
      userNameController.text =
          (await storage.read(key: KeyConstant.KEY_USER_NAME))!;
      setState(() {
        isLogging = true;
      });
    }
  }

  @override
  void initState() {
    checkUserLogging();
    checkUsingBiometric();
    super.initState();
  }

  void authenticate() async {
    final authenticated = await LocalAuthApi.authenticate();
    if (authenticated) {
      final usernameStored = await storage.read(key: KeyConstant.KEY_USER_NAME);
      final passwordStored = await storage.read(key: KeyConstant.KEY_PASSWORD);
      doLogin(usernameStored!, passwordStored!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (!isLogging) buildTextFormField(false),
          if (isLogging) textHelloUser(),
          SizedBox(height: size32),
          buildTextFormField(true),
          btnForgotPasswordOrLoginAnother(),
          btnLogin(),
          if (usingBiometric) textOrLoginBy(),
          if (usingBiometric) iconAuthenticate()
        ],
      ),
    );
  }

  Column textHelloUser() {
    return Column(
      children: [
        Text(
          kHello + ',',
          style: TextStyle(fontSize: size20, color: kPrimaryColor),
        ),
        fullName != null
            ? Text(
                fullName!,
                style: TextStyle(
                    fontSize: size32,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              )
            : SizedBox(),
      ],
    );
  }

  GestureDetector iconAuthenticate() => GestureDetector(
        onTap: () => authenticate(),
        child: isFaceID
            ? Image.asset(
                'assets/icons/face-id.png',
                color: kPrimaryColor,
              )
            : Icon(FontAwesomeIcons.fingerprint, color: kPrimaryColor, size: size36,),
      );

  Padding textOrLoginBy() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: size36),
      child: Text(
        kOrLoginBy,
        style: TextStyle(
          color: kTextFieldColor,
        ),
      ),
    );
  }

  SizedBox btnLogin() {
    return SizedBox(
      width: double.infinity,
      child: isLoadingLogin
          ? LoadingWidget(color: kPrimaryColor)
          : DefaultButton(
              text: kSignIn,
              press: () => validateForm(),
            ),
    );
  }

  Row btnForgotPasswordOrLoginAnother() {
    return Row(
      mainAxisAlignment:
          isLogging ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => goToForgotPassword(),
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(vertical: size14),
            child: Text(
              kForgotPassword,
              style: TextStyle(
                color: kTextFieldColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        isLogging
            ? Expanded(
                child: TextButton(
                  onPressed: () => loginAccountAnother(),
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(vertical: size14),
                    child: Text(
                      kLoginByAnotherAccount,
                      style: TextStyle(
                        color: kTextFieldColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  TextFormField buildTextFormField(bool isPassword) {
    return TextFormField(
      obscureText: isPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: isPassword ? passwordController : userNameController,
      textInputAction: isPassword ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (value) => isPassword ? validateForm() : null,
      validator: (value) {
        if (value!.isEmpty) {
          return isPassword ? kPassNullError : kPhoneNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: isPassword ? "Nhập mật khẩu" : "Nhập số điện thoại",
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: size36, vertical: size18),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: size14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(size20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(size20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kErrorColor),
          borderRadius: BorderRadius.circular(size20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kErrorColor),
          borderRadius: BorderRadius.circular(size20),
        ),
      ),
    );
  }
}
