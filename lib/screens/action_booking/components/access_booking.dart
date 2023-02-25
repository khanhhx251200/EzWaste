import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/components/info_customer.dart';
import 'package:recycle_app/components/loading_widget.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/models/booking.dart';
import 'package:recycle_app/screens/action_booking/components/rating_star.dart';
import 'package:recycle_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';

import 'confirm_booking_success.dart';

class AccessBookingScreen extends StatefulWidget {
  static final String routeName = '/agree-order';

  const AccessBookingScreen({Key? key}) : super(key: key);

  @override
  State<AccessBookingScreen> createState() => _AccessBookingScreenState();
}

class _AccessBookingScreenState extends State<AccessBookingScreen> {
  final feedbackController = new TextEditingController();

  double numberRating = 0;
  bool isLoading = false;

  setNumberRating(double value) {
    setState(() => numberRating = value);
  }

  @override
  Widget build(BuildContext context) {
    final Booking booking =
        ModalRoute.of(context)?.settings.arguments as Booking;
    final provider = Provider.of<BookingProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          kComplete,
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
      extendBody: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_booking.png'),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(size32),
          child: Column(
            children: [
              Text(
                kTitleQuestionContentment,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: size18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size32,
              ),
              InfoShipper(
                  booking: booking),
              RatingStar(
                notifyParent: setNumberRating,
              ),
              TextField(
                controller: feedbackController,
                textInputAction: TextInputAction.done,
                maxLines: null,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Ý kiến đóng góp kiến của bạn',
                    filled: true,
                    fillColor: kWhiteColor,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    hintStyle: TextStyle(color: kTextColor),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: kSecondaryTextColor, width: 1))),
              ),
              Container(
                      margin: EdgeInsets.only(top: size14),
                      width: double.infinity,
                      child: isLoading
                          ? LoadingWidget(color: kPrimaryColor)
                          : DefaultButton(
                        text: kSendInformation,
                        press: () async {
                          setState(() => isLoading = true);
                          final response = await provider.accessBooking(
                              booking.id!, feedbackController.text, numberRating);
                          if (response != null) {
                            Navigator.pushReplacementNamed(
                                context, ConfirmBookingSuccess.routeName);
                          }
                          setState(() => isLoading = false);

                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
