import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/screens/history/components/agree_order_fragment.dart';
import 'package:shop_app/screens/history/components/info_shipper.dart';
import 'package:shop_app/screens/history/components/product_in_order.dart';

import 'refuse_fragment.dart';

class ConfirmOrder extends StatelessWidget {
  static final String routeName = '/confirm-order';

  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Order order = ModalRoute.of(context)?.settings.arguments as Order;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kConfirmRecycle,
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                kTitleQuestionConfirm,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size32,
              ),
              InfoShipper(fullName: order.userShipperFullName, userName: order.userShipper),
              ProductInOrder(order: order),
              Container(
                margin: EdgeInsets.only(top: size32),
                width: double.infinity,
                child: DefaultButton(
                  text: kAgree,
                  press: () => Navigator.pushNamed(
                      context, AccessBookingScreen.routeName,
                      arguments: order),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size14),
                width: double.infinity,
                child: DefaultButton(
                  text: kRefuse,
                  color: kErrorColor,
                  press: () => Navigator.pushNamed(
                      context, RefuseBookingScreen.routeName,
                      arguments: order),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
