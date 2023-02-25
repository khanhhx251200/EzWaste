import 'dart:async';

import 'package:animated_check/animated_check.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/screens/login/login2_screen.dart';
import 'package:recycle_app/services/share_preferences_service.dart';

class ChangePasswordSuccess extends StatefulWidget {
  static String routeName = '/change_password_success';

  const ChangePasswordSuccess({Key? key}) : super(key: key);

  @override
  _ChangePasswordSuccessState createState() => _ChangePasswordSuccessState();
}

class _ChangePasswordSuccessState extends State<ChangePasswordSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isShowCheck = true;
  final _pref = PreferencesService();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));

    _animation = new Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));
    Future.delayed(defaultDuration, () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(size14),
          child: Column(
            children: [
              Spacer(),
              isShowCheck
                  ? Container(
                      padding: const EdgeInsets.all(size8),
                      decoration: BoxDecoration(
                          color: Color(0xFF39C541), shape: BoxShape.circle),
                      child: AnimatedCheck(
                        color: kWhiteColor,
                        progress: _animation,
                        size: size40,
                      ),
                    )
                  : Center(
                      child: Icon(Icons.error, color: kErrorColor),
                    ),
              SizedBox(height: size14),
              Text('Đặt lại mật khẩu thành công',
                  style: TextStyle(
                      fontSize: size18,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor)),
              SizedBox(height: size14),
              Text(
                  'Từ nay bạn hãy dùng mật khẩu mới để đăng nhập và sử dụng ứng dụng',
                  style: TextStyle(
                      color: kBlackColor)),
              SizedBox(height: size14),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: DefaultButton(
                  text: 'Hoàn thành',
                  press: () async {
                      await _pref.logout();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Login2Screen.routeName, (Route<dynamic> route) => false);
                  },
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
