import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/new_design/dashboash/dashboash_screen.dart';

class BookingSuccess extends StatelessWidget {
  static String routeName = "/booking_success";

  const BookingSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
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
                    'Đặt lịch thành công',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: size18),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(size14),
                  child: Text(
                    'Tài xế của chúng tôi đã nhận được đơn và sẽ đến thu gom rác theo thời gian bạn đặt nhé',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/hand_and_heart.png',
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
