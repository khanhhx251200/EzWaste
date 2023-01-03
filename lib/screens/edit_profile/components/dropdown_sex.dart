import 'package:flutter/material.dart';
import 'package:shop_app/components/border_field.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class EditSex extends StatefulWidget {
  const EditSex({Key? key, required this.sex, required this.provider,required this.controller})
      : super(key: key);
  final int? sex;
  final AuthProvider? provider;
  final TextEditingController controller;

  @override
  State<EditSex> createState() => _EditSexState();
}

class _EditSexState extends State<EditSex> {
  int valueDD = 1;

  @override
  void initState() {
    super.initState();
    if (widget.sex != null) {
      valueDD = widget.sex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: inputDecoration('', false, widget.controller),
        style: TextStyle(color: kTextColor,fontSize: size14),
        isExpanded: true,
        value: valueDD,
        items: <int>[0, 1, 2].map(buildMenuItem).toList(),
        onChanged: (value) {
          setState(() {
            valueDD = value!;
          });
          widget.provider!.userInfo.gender = value;
        },
      ),
    );
  }

  DropdownMenuItem<int> buildMenuItem(int value) {
    return DropdownMenuItem<int>(
      value: value,
      child: Text(getValueName(value), style: TextStyle(color: kTextColor)),
    );
  }

  getValueName(int value) {
    if (value == 0) {
      return 'Nam';
    } else if (value == 1) {
      return 'Nữ';
    } else {
      return 'Khác';
    }
  }
}
