import 'package:flutter/material.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/dashboash/dashboash_screen.dart';
import 'package:recycle_app/services/local_notification_service.dart';

class BookingSuccess extends StatefulWidget {
  static String routeName = "/booking_success";

  const BookingSuccess({Key? key}) : super(key: key);

  @override
  State<BookingSuccess> createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
  final String title = 'Đặt lịch thành công';
  final String content = 'Tài xế của chúng tôi đã nhận được đơn và sẽ đến thu gom rác theo thời gian bạn đặt nhé';

  @override
  void initState() {
    super.initState();
    LocalNotificationService.addNotification(title, content, DateTime
        .now()
        .millisecondsSinceEpoch + 10, 'booking_success');
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_booking.png'),
                fit: BoxFit.cover)
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
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: size18),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(size14),
                  child: Text(
                    content,
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
                  press: () =>
                      Navigator.pushReplacementNamed(
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
