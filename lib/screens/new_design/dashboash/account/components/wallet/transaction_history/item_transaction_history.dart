import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';

class ItemTransactionHistory extends StatelessWidget {
  const ItemTransactionHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: size8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(size8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kBlueColor),
                  child: SvgPicture.asset(
                    'assets/icons/cart.svg',
                    height: size16,
                    width: size16,
                    color: kWhiteColor,
                  )),
              SizedBox(
                width: size20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: kPay,
                              style: TextStyle(
                                color: kBlackColor,
                                fontSize: size14,
                              )),
                          TextSpan(
                              text:
                              " VIETNAM AIRLINE 999, Hà Nội, VIỆT NAM",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: size14,
                                  fontWeight: FontWeight.w600)),
                        ]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    SizedBox(
                      height: size8 / 2,
                    ),
                    Text(
                      convertTimeStampToStringDetail(
                          DateTime.now().millisecondsSinceEpoch),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(
                          fontSize: size14, color: kTextColor),
                    )
                  ],
                ),
                flex: 3,
              ),
              SizedBox(
                width: size8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("-${convertNumberToCurrency(24000)}",
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: size14,
                        )),
                    SizedBox(
                      height: size8 / 2,
                    ),
                    Text(
                      false ? "Thành công" : "Thất bại",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(
                          fontSize: size12,
                          color:
                          false ? kSuccessColor : kErrorColor),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
