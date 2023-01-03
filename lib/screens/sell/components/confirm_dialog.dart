import 'package:animated_check/animated_check.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/sell.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/sell/sell_provider.dart';
import 'package:shop_app/size_config.dart';

class ConfirmSellDialog extends StatefulWidget {
  const ConfirmSellDialog(
      {Key? key, required this.sell, required this.provider})
      : super(key: key);
  final Sell sell;
  final SellProvider provider;

  @override
  _ConfirmSellDialogState createState() => _ConfirmSellDialogState();
}

class _ConfirmSellDialogState extends State<ConfirmSellDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isShowCheck = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));

    _animation = new Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isShowCheck
            ? !isError
            ? Container(
          margin: const EdgeInsets.all(size8),
          padding: const EdgeInsets.all(size8),
          decoration: BoxDecoration(
              color: kSuccessColor, shape: BoxShape.circle),
          child: AnimatedCheck(
            color: kWhiteColor,
            progress: _animation,
            size: 40,
          ),
        )
            : Center(
          child: Icon(Icons.error, color: kErrorColor),
        )
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Xác nhận đặt lịch thu gom',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 20)),
        ),
        Divider(thickness: 1),
        SizedBox(height: getProportionateScreenHeight(size8)),
        infoText(
            title: 'Loại: ',
            content: widget.sell.typeOrder ? 'Rác sinh hoạt' : 'Rác tái chế'),
        SizedBox(height: getProportionateScreenHeight(size8)),
        infoText(
            title: 'Địa chỉ: ',
            content: widget.sell.address),
        SizedBox(height: getProportionateScreenHeight(size8)),
        infoText(
            title: 'Thời gian thu gom: ',
            content:
            widget.sell.timeShow),
        SizedBox(height: getProportionateScreenHeight(size8)),
        InkWell(
          onTap: () async {
            await widget.provider.setSchedule(
                context, widget.sell, changeIsError, showCheckSuccess);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: size14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size24),
                  bottomRight: Radius.circular(size24)),
            ),
            child: Center(
              child: Text(kConfirm,
                  style: TextStyle(
                      color: kWhiteColor, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }

  Padding infoText({String? title, String? content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(color: kBlackColor, fontSize: size14),
          ),
          Expanded(
            child: Text(content!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.provider.typeOrder ? kOrganicColor : kPlasticColor,
                    fontSize: size14)),
          ),
        ],
      ),
    );
  }

  changeIsError() {
    print('error');
    setState(() {
      isError = !isError;
    });
  }

  showCheckSuccess() {
    print('success');
    setState(() => isShowCheck = true);
    _animationController.forward();
    showToastInApp(context, 'Đặt lịch thu gom thành công!!',
        backgroundColor: kSuccessColor, textColor: kWhiteColor, align: kBOTTOM);
    Future.delayed(Duration(seconds: 1), () {
      if(mounted){
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
  }
}
