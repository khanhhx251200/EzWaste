import 'package:flutter/material.dart';
import 'package:recycle_app/components/decoration_border_shadow.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/confirm_booking/components/btn_action.dart';
import 'package:recycle_app/screens/new_design/confirm_booking/components/btn_status.dart';

class InfoOrganic extends StatelessWidget {
  const InfoOrganic({
    Key? key,
    required this.idOrder,
    required this.totalMass,
    required this.status,
  }) : super(key: key);
  final int idOrder;
  final double totalMass;
  final int status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: size24),
          decoration: boxDecorationShadow(radius: size20),
          child: ListTile(
            leading: Icon(
              Icons.delete,
              color: kOrganicColor,
            ),
            title: Text(
              kOrganicRecycle,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: size14),
            ),
            trailing: Text(
              '${totalMass}kg',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: size14),
            ),
          ),
        ),
        // Container(
        //     margin: EdgeInsets.only(top: 48),
        //     child:
        //         status == 3 ? BtnActionConfirm(booking: idOrder) : ButtonStatus(status: status))
      ],
    );
  }
}
