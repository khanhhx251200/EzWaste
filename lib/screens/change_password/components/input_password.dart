import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class InputPassword extends StatefulWidget {
  const InputPassword(
      {Key? key,
      required this.title,
      required this.controller,
      this.newPasswordController})
      : super(key: key);
  final TextEditingController controller;
  final TextEditingController? newPasswordController;
  final String title;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isHide,
      style: TextStyle(color: kTextFieldColor, fontSize: size16),
      decoration: InputDecoration(
          hintText: widget.title,
          filled: true,
          fillColor: kBackgroundTextFieldColor,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffix: GestureDetector(
              onTap: () => setState(() {
                    isHide = !isHide;
                  }),
              child: Icon(
                !isHide
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined,
                color: kTextFieldColor,
              ))),
      onChanged: (value) {
        if (widget.newPasswordController != null &&
            value != widget.newPasswordController!.text) {
          print('Xác nhận mật khẩu mới không trùng');

        }
      },
      validator: (String? value) {
        if (value!.trim().isEmpty) {
          return 'Mật khẩu là bắt buộc';
        } else if (widget.newPasswordController != null &&
            value != widget.newPasswordController!.text) {
          return 'Xác nhận mật khẩu mới không trùng';
        }
      },
    );
  }
}
