import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';

import '../../../core/constants/strings_constant.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? password;
  String? confirmPassword;
  bool remember = false;
  bool _autoValidate=false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  signUp(AuthProvider provider){
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // if all are valid then go to success screen
      provider.signUp(context, phone!, password!);
      // Navigator.pushNamed(context, OtpScreen.routeName);
    } else {
      setState(() {
        _autoValidate=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
       return Form(
         autovalidateMode: _autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled ,
         key: _formKey,
         child: Column(
           children: [
             buildPhoneFormField(),
             SizedBox(height: getProportionateScreenHeight(30)),
             buildPasswordFormField(),
             SizedBox(height: getProportionateScreenHeight(30)),
             buildConfirmPassFormField(provider),
             FormError(errors: errors),
             SizedBox(height: getProportionateScreenHeight(40)),
             provider.isLoading ? LoadingWidget(color: kPrimaryColor) : SizedBox(
               width: getProportionateScreenWidth(double.infinity),
               height: getProportionateScreenHeight(40),
               child: DefaultButton(
                 text: kSignUp,
                 press: () => signUp(provider),
               ),
             ),
           ],
         ),
       );
      } ,
    );
  }

  TextFormField buildConfirmPassFormField(AuthProvider provider) {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.disabled,
      onSaved: (newValue) => confirmPassword = newValue,
      onFieldSubmitted: (value) => signUp(provider),
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if ((password != value)) {
          return kMatchPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Xác nhận mật khẩu",
        hintText: "Nhập lại mật khẩu ",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) => setState(() {
        password = value;
      }),
      validator: (value) {
        if(value!.isEmpty){
          return kPassNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: kPassword,
        hintText: "Nhập mật khẩu",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => phone = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kPhone;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: kPhone,
        hintText: "Nhập số điện thoại",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
