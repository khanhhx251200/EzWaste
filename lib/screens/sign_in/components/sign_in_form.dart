import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';

import '../../../components/default_button.dart';
import '../../../core/constants/strings_constant.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? phone;
  String? password;
  bool? remember = false;

  signIn(AuthProvider provider) async {
    try {
      UserInfo user = await provider.signIn(
          context, userNameController.text, passwordController.text);
      if(user != null) {
        context.read<HomeProvider>().setUserInfo(user);
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildPhoneFormField(),
              SizedBox(height: getProportionateScreenHeight(size20)),
              buildPasswordFormField(provider),
              SizedBox(height: getProportionateScreenHeight(size20)),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: remember,
              //       activeColor: kPrimaryColor,
              //       onChanged: (value) {
              //         setState(() {
              //           remember = value;
              //         });
              //       },
              //     ),
              //     Text("Nhớ mật khẩu"),
              //     Spacer(),
              //     GestureDetector(
              //       onTap: () => Navigator.pushNamed(
              //           context, ForgotPasswordScreen.routeName),
              //       child: Text(
              //         "Quên mật khẩu",
              //         style: TextStyle(decoration: TextDecoration.underline),
              //       ),
              //     )
              //   ],
              // ),
              // SizedBox(height: getProportionateScreenHeight(20)),
              provider.isLoading
                  ? LoadingWidget(color: kPrimaryColor)
                  : SizedBox(
                      width: getProportionateScreenWidth(double.infinity),
                      child: DefaultButton(
                        text: "Đăng nhập",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // if all are valid then go to success screen
                            KeyboardUtil.hideKeyboard(context);
                            signIn(provider);
                          }
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  Row buildPasswordFormField(AuthProvider provider) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/Lock.svg'),
        SizedBox(width: size14),
        Expanded(
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            textInputAction: TextInputAction.done,
            onSaved: (newValue) => password = newValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (value) => signIn(provider),
            onChanged: (newValue) => phone = newValue,
            validator: (value) {
              if (value!.isEmpty) {
                return "$kPassNullError";
              }
              return null;
            },
            style: TextStyle(
                color: kTextFieldSecondColor, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: "Nhập mật khẩu",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhoneFormField() {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/Phone.svg'),
        SizedBox(width: size14),
        Expanded(
          child: TextFormField(
            controller: userNameController,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (newValue) => phone = newValue,
            onChanged: (newValue) => phone = newValue,
            validator: (value) {
              if (value!.isEmpty) {
                return kPhoneNumberNullError;
              }
              return null;
            },
            style: TextStyle(
                color: kTextFieldSecondColor, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: "Nhập số điện thoại",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: null,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
