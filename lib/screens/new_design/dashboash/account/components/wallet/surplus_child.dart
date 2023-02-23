import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'action_vertical.dart';

class SurplusChild extends StatelessWidget {
  const SurplusChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      children: [
        ActionVertical(icon: Icons.add, title: kRecharge),
        ActionVertical(icon: Icons.account_balance_wallet_outlined, title: kTransferMoney),
        ActionVertical(icon: Icons.money_off, title: "Phụ thu"),
        ActionVertical(icon: Icons.assignment, title: "Lịch sử GD"),
      ],
    );
  }
}
