import 'package:flutter/material.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/change_password/components/change_password_success.dart';
import 'package:recycle_app/screens/change_password/components/input_password.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String routeName = '/change_password';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordOldController = TextEditingController();
  final _passwordNewController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isConfirm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(
          'Thay đổi mật khẩu',
          style: TextStyle(
            color: kBlackColor
          ),
        ),
        backgroundColor: kWhiteColor,
        leading: BackButton(color: kGreyColor),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(size8),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              Image.asset(
                'assets/icons/logo_waste.png',
                height: 80,
              ),
              Text('Nhập mật khẩu mới cho tài khoản của bạn'),
              SizedBox(height: size14),
              InputPassword(
                title: 'Mật khẩu cũ',
                controller: _passwordOldController,
              ),
              SizedBox(height: size14),
              InputPassword(
                title: 'Mật khẩu mới',
                controller: _passwordNewController,
              ),
              SizedBox(height: size14),
              InputPassword(
                title: 'Xác nhận mật khẩu mới',
                controller: _passwordConfirmController,
                newPasswordController: _passwordNewController,
              ),
              SizedBox(height: size14),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: DefaultButton(
                  text: kConfirm,
                  press: () {
                    setState(() {
                      isConfirm = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      print('Mật khẩu mới: ${_passwordConfirmController.text}');
                      Navigator.pushNamed(
                          context, ChangePasswordSuccess.routeName);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
