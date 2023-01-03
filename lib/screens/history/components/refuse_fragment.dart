import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';

import 'confirm_order_success.dart';
import 'info_shipper.dart';

class RefuseBookingScreen extends StatefulWidget {
  static final String routeName = '/refuse';

  const RefuseBookingScreen({Key? key}) : super(key: key);

  @override
  State<RefuseBookingScreen> createState() => _RefuseBookingScreenState();
}

class _RefuseBookingScreenState extends State<RefuseBookingScreen> {
  final reasonController = new TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Booking booking =
        ModalRoute.of(context)?.settings.arguments as Booking;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          kRefuse,
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_booking.png'),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(size32),
          child: Column(
            children: [
              InfoShipper(
                  fullName: booking.nameShipper!,
                  userName: booking.phoneShipper!),
              SizedBox(
                height: size32,
              ),
              TextField(
                controller: reasonController,
                maxLines: null,
                minLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: kTitleReasonRefuse,
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
                margin: EdgeInsets.only(top: size32),
                width: double.infinity,
                child: isLoading
                    ? LoadingWidget(color: kPrimaryColor)
                    : DefaultButton(
                  text: kSendInformation,
                  press: () async {
                    BookingProvider provider =
                        Provider.of<BookingProvider>(context, listen: false);
                    setState(() => isLoading = true);
                    final response = await provider.refuseBooking(
                        booking.id!, reasonController.text);
                    if (response != null) {
                      Navigator.pushReplacementNamed(
                          context, ConfirmOrderSuccess.routeName);
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
