import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/login/components/form_login/form_login.dart';

class Login2Screen extends StatelessWidget {
  static String routeName = "/login2";

  const Login2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(size36),
          child: Column(
            children: [
              Hero(
                tag: 'logo_app',
                child: Center(
                  child: Image.asset(
                    'assets/icons/logo_waste.png',
                    height: _size.height * 0.2,
                    width: _size.width * 0.4,
                  ),
                ),
              ),
              const Text(
                kContentLogin,
                style: TextStyle(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size24,),
              FormLogin()
            ],
          ),
        ),
      )),
    );
  }
}
