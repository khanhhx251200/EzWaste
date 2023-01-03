import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/sell.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/sell/components/address_order.dart';
import 'package:shop_app/screens/sell/components/confirm_dialog.dart';
import 'package:shop_app/screens/sell/components/style_title.dart';
import 'package:shop_app/screens/sell/components/time_order.dart';
import 'package:shop_app/screens/sell/sell_provider.dart';
import 'package:shop_app/size_config.dart';

class SellScreen extends StatefulWidget {
  static String routeName = "/sell";

  const SellScreen({Key? key}) : super(key: key);

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(kISell, style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold
            ),),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kBooking + ' thu gom',
                    style: styleTitle(),
                  ),
                  Text(
                    'Vui lòng chọn thời gian thu gom mong muốn',
                    style: TextStyle(fontSize: size12),
                  ),
                  SizedBox(height: getProportionateScreenHeight(size20)),
                  AddressOrder(),
                  SizedBox(
                      height: getProportionateScreenHeight(size8)),
                  DateOrder(provider: provider),
                  SizedBox(
                      height: getProportionateScreenHeight(size8)),
                  Container(
                    width: getProportionateScreenWidth(double.infinity),
                    height: getProportionateScreenHeight(40),
                    child: DefaultButton(
                      text: 'Xác nhận',
                      press: () => confirmSell(provider),
                    ),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }

  showDialogConfirm(SellProvider provider, Sell sell) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(size24))),
              child: ConfirmSellDialog(
            sell: sell,
            provider: provider,
          ));
        });
  }

  confirmSell(SellProvider provider) {
    validateTime(provider);
  }

  void validateTime(SellProvider provider) {
    if(provider.dateSellSelected != null && provider.dateSellSelected!.isSelected){
      String timeShow =
          "${convertDateToString(provider.dateSellSelected!.dateTime)}";
      String timeSend =
          "${DateFormat('yyyy-MM-dd').format(provider.dateSellSelected!.dateTime!)}";
      print(provider.typeOrder);

      Sell sell = Sell(
          provider.typeAddress,
          provider.typeOrder,
          context.read<HomeProvider>().userInfo!.address ?? '',
          timeSend,
          timeShow: timeShow);
      showDialogConfirm(provider, sell);
    } else {
      showToastInApp(context, 'Vui lòng chọn thời gian dự kiến thu gom!!',
          backgroundColor: kWarningColor, textColor: kWhiteColor);
    }
  }
}
