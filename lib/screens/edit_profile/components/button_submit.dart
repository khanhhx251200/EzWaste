import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_app/core/constants/color_constants.dart';

class MySubmitButton extends StatelessWidget {
  FormGroup? formEditProfile;
  MySubmitButton(this.formEditProfile);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) => MaterialButton(
        onPressed: formEditProfile!.valid ? _onPressed : null,
        color: kPrimaryColor,
      ),
    );
  }

  void _onPressed() {
    print('Hello Reactive Forms!!!');
  }
}
