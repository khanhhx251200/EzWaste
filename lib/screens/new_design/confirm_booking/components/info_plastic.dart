import 'package:flutter/material.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/models/item.dart';
import 'package:shop_app/screens/new_design/confirm_booking/components/btn_action.dart';
import 'package:shop_app/screens/new_design/confirm_booking/components/btn_status.dart';

class InfoPlastic extends StatelessWidget {
  const InfoPlastic({
    Key? key,
    required this.idOrder,
    required this.totalMass,
    required this.status,
    required this.booking,
  }) : super(key: key);
  final int idOrder;
  final double totalMass;
  final int status;
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecorationShadow(radius: size20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              infoTotal(),
              status >= 3 && booking.items != null
                  ? Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: kGreyColor.withOpacity(0.2),
                                    width: 1))),
                        child: ListView.builder(
                          itemCount: booking.items!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              itemList(booking.items![index]),
                        ),
                      ),
                    )
                  : SizedBox(),
              Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(
                      horizontal: size24, vertical: size14),
                  alignment: Alignment.bottomCenter,
                  child: status == 3
                      ? BtnActionConfirm(booking: booking)
                      : ButtonStatus(status: status))
            ],
          ),
        ),
      ],
    );
  }

  ListTile itemList(Item item) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: size16),
      leading: Padding(
        padding: const EdgeInsets.all(size8),
        child: Container(
          height: size8,
          width: size8,
          decoration: BoxDecoration(shape: BoxShape.circle, color: kGreenColor),
        ),
      ),
      title: Text(
        item.name!,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: size12),
      ),
      trailing: Text(
        '${item.mass}kg',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: size14),
      ),
    );
  }

  ListTile infoTotal() {
    return ListTile(
      leading: Icon(
        Icons.delete,
        color: kPlasticColor,
      ),
      title: Text(
        kPlasticRecycle,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: size14),
      ),
      trailing: booking.status! >= 3
          ? Text(
              '${totalMass}kg',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: size16),
            )
          : SizedBox(),
    );
  }

  Container btnAction() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DefaultButton(
              text: kAgree,
              press: () => print('Đồng ý'),
            ),
          ),
          SizedBox(
            width: size16,
          ),
          Expanded(
            child: DefaultButton(
              text: kRefuse,
              color: kErrorColor,
              press: () => print('Từ chối'),
            ),
          ),
        ],
      ),
    );
  }
}
