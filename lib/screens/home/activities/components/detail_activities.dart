import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/home/activities/provider/activities_provider.dart';

class DetailActivities extends StatelessWidget {
  const DetailActivities({
    Key? key,
    required this.provider,
  }) : super(key: key);
  final ActivitiesProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelActivities(kQuantityTaken),
        SizedBox(height: size36),
        containerDetail(
            'assets/images/capa.png',
            '${provider.statisticBooking!.sumMassSh} kg',
            '${provider.statisticBooking!.sumMassTc} kg'),
        SizedBox(height: size36),
        labelActivities(kAmountReceived),
        SizedBox(height: size36),
        containerDetail(
            'assets/images/100_green.png',
            '${provider.statisticBooking!.sumMoneySh} VNĐ',
            '${provider.statisticBooking!.sumMoneyTc} VNĐ')
      ],
    );
  }

  GestureDetector containerDetail(
      String urlImage, String textOrganic, String textPlastic,) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(flex: 1, child: Image.asset(urlImage)),
          const SizedBox(
            width: size32,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boxDetail(kOrganicRecycle, kOrganicColor, textOrganic),
                const SizedBox(
                  height: size20,
                ),
                boxDetail(kPlasticRecycle, kPlasticColor, textPlastic,
                    isMoney: true),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container boxDetail(String label, Color color, String value,
      {bool isMoney = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: size8 / 2, horizontal: size8),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(size20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: size10,
            offset: Offset(0, 2), // changes position of shadow
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
              icon: Icon(
                  isMoney
                      ? const IconData(0xf24e, fontFamily: 'MaterialIcons')
                      : Icons.delete,
                  color: color),
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
                      fontSize: size16,
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
