import 'package:flutter/material.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/dashboash/dashboash_screen.dart';

class ConfirmBookingSuccess extends StatelessWidget {
  static String routeName = "/confirm_order_success";

  const ConfirmBookingSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/background_booking.png'), fit: BoxFit.cover)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size14, vertical: _size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(size14),
                  child: Text(
                    kThanksForFeedback,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: size18),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/global.png',
                width: _size.width * 0.6,
                height: _size.height * 0.5,
              ),
              SizedBox(
                width: _size.width,
                child: DefaultButton(
                  press: () => Navigator.pushReplacementNamed(
                      context, DashBoardScreen.routeName),
                  text: kBackToHome,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}