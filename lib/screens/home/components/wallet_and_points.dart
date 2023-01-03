import 'package:flutter/material.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/size_config.dart';
import 'package:provider/provider.dart';
class WalletAndPoints extends StatefulWidget {
  const WalletAndPoints({Key? key}) : super(key: key);

  @override
  _WalletAndPointsState createState() => _WalletAndPointsState();
}

class _WalletAndPointsState extends State<WalletAndPoints> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      padding: EdgeInsets.all(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  child: buildCash(
                      kSurplus,
                      (context.read<AuthProvider>().userInfo.moneySeller).toString(),
                      Icons.report)),
              SizedBox(width: 2),
              Expanded(
                  child:
                      buildCash(kTotalWeight, context.read<AuthProvider>().userInfo.khoiluongShipper.toString(), Icons.emoji_events_sharp)),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(4)),
          Container(
            width: double.infinity,
            color: kWhiteColor,
            padding: EdgeInsets.symmetric(horizontal: size8),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kWhiteColor),
                shadowColor: MaterialStateProperty.all(kGreyColor),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: kBlackColor,
                        size: size20,
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: CircleAvatar(
                            backgroundColor: kWhiteColor,
                            radius: 5,
                            child: CircleAvatar(
                              radius: 4,
                              child: Icon(
                                Icons.add,
                                color: kWhiteColor,
                                size: 6,
                              ),
                              backgroundColor: kPrimaryColor,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(width: getProportionateScreenWidth(4)),
                  Text('Nạp tiền',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kBlackColor)),
                  SizedBox(width: getProportionateScreenWidth(4)),
                  Icon(
                    Icons.circle,
                    size: 4,
                    color: kBlackColor,
                  ),
                  SizedBox(width: getProportionateScreenWidth(4)),
                  Text('Wallet',
                      style:
                          TextStyle(color: kBlackColor, fontSize: size12)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  double totalMass() {
    double plasticMass = context.read<HomeProvider>().userInfo?.massTaiChe ?? 0;
    double organicMass = context.read<HomeProvider>().userInfo?.massSinhHoat ?? 0;
    return plasticMass + organicMass;
  }

  buildCash(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(size8),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: kGreyColor.withOpacity(0.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(color: kBlackColor, fontSize: size12)),
          Row(
            children: [
              Expanded(
                child: Text(value + '${title == kTotalWeight ? 'kg' : ''}',
                    style: TextStyle(
                        color: kBlackColor, fontWeight: FontWeight.bold)),
              ),
              Icon(
                icon,
                color: title == kTotalWeight ? kPrimaryColor : kWarningColor,
                size: size18,
              )
            ],
          )
        ],
      ),
    );
  }
}
