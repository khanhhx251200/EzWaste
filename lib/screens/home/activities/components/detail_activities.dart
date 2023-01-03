import 'package:flutter/material.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/new_design/dashboash/dashboash_screen.dart';

class DetailActivities extends StatelessWidget {
  const DetailActivities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelActivities(kQuantityTaken),
        SizedBox(height: size36),
        containerDetail('assets/images/capa.png', '8Kg', '10kg'),
        SizedBox(height: size36),
        labelActivities(kAmountReceived),
        SizedBox(height: size36),
        containerDetail(
            'assets/images/100_green.png', '2,500,000 đ', '3,000,000 đ',
            isMoney: true)
      ],
    );
  }

  GestureDetector containerDetail(String urlImage, String textOrganic, String textPlastic,
      {bool isMoney = false}) {
    return GestureDetector(
      onTap: () {
      },
      child: Row(
        children: [
          Expanded(flex: isMoney ? 1 : 2, child: Image.asset(urlImage)),
          const SizedBox(
            width: size32,
          ),
          Expanded(
            flex: isMoney ? 2 : 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boxDetail(kOrganicRecycle, kOrganicColor, textOrganic),
                const SizedBox(
                  height: size20,
                ),
                boxDetail(kPlasticRecycle, kPlasticColor, textPlastic),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container boxDetail(String label, Color color, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: size8 / 2, horizontal: size8),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(size20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: size10 / 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: new BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.all(size8),
            child: IconButton(
              icon: Icon(Icons.delete, color: color),
              onPressed: null,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                      color: color,
                      fontSize: size20,
                      fontWeight: FontWeight.w700),
                ),
                Text(label, style: TextStyle(color: color, fontSize: size12))
              ],
            ),
          )
        ],
      ),
    );
  }

  Text labelActivities(String label) {
    return Text(
      label,
      style: TextStyle(
          fontSize: size16, fontWeight: FontWeight.w600, color: kBlackColor),
    );
  }
}
