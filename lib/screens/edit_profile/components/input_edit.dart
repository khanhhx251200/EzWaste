import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/components/border_field.dart';

class InputEdit extends StatefulWidget {
  const InputEdit({Key? key, required this.controller, required this.title})
      : super(key: key);
  final TextEditingController controller;
  final String title;

  @override
  _InputEditState createState() => _InputEditState();
}

class _InputEditState extends State<InputEdit> {
  bool isShowClear = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.title == 'Số khẩu' ? TextInputType.number : TextInputType.text,
      inputFormatters: widget.title == 'Số khẩu' ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ] : null,
      decoration: inputDecoration(widget.title, isShowClear, widget.controller),
      style: TextStyle(fontSize: size14),
      onTap: () => setState(() {
        isShowClear = true;
      }),
      onFieldSubmitted: (value) => setState(() {
        isShowClear = false;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return kNamelNullError;
        } else {
          return null;
        }
      },
    );
  }
}
