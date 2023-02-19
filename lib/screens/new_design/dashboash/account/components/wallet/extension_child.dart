import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/action_horizontal.dart';

class ExtensionChild extends StatelessWidget {
  const ExtensionChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size8),
      child: Column(
        children: [
          ActionHorizontal(
            icon: Icons.inventory_outlined,
            onClickAction: () {
              print('Quản lý chi tiêu');
            },
            title: "Quản lý chi tiêu",
          )
        ],
      ),
    );
  }
}
