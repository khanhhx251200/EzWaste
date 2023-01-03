import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/components/alway_disable_focus.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

class InputEditBirthday extends StatefulWidget {
  const InputEditBirthday({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  _InputEditBirthdayState createState() => _InputEditBirthdayState();
}

class _InputEditBirthdayState extends State<InputEditBirthday> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: AlwaysDisabledFocusNode(),
      decoration: InputDecoration(
          hintText: 'Ngày sinh (không bắt buộc)',
          suffixIcon: Icon(Icons.date_range),
          enabledBorder: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kErrorColor)),
          ),
      style: TextStyle(fontSize: size14),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showDatePicker(widget.controller);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kNamelNullError;
        } else {
          return null;
        }
      },
    );
  }

  Future<void> showDatePicker(TextEditingController controller) async {
    FocusScope.of(context).unfocus();
    await DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(DateTime.now().year - 100, 1, 1),
        maxTime: DateTime.now(),
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(date);
      });
    }, currentTime: getInitTime(controller), locale: LocaleType.vi);
  }

  DateTime getInitTime(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return DateTime.now();
    } else {
      return convertStringToDateTime(controller.text);
    }
  }
}
