import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/screens/sign_in/components/sign_in_form.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: _size.width,
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/bg-login.svg',
                  height: _size.height * 0.4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Đăng nhập',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: kTextFieldSecondColor)),
                  Image.asset('assets/icons/logo_waste.png', height: 56, width: 56,)
                ],
              ),
              SignInForm()
            ],
          ),
        ),
      )),
    );
  }
}
