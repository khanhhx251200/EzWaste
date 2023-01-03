import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/location.dart';
import 'package:shop_app/screens/sell/components/style_title.dart';
import 'package:shop_app/screens/sell/sell_provider.dart';

class ItemLocation extends StatelessWidget {
  const ItemLocation({Key? key, required this.location, required this.provider}) : super(key: key);
  final LocationModel location;
  final SellProvider provider;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              provider.removeItemLocationToList(location);
            },
            backgroundColor: kErrorColor,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: kDelete,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: location.isSelected ? kPrimaryColor : kWhiteColor,
              width: 1),
          borderRadius: BorderRadius.circular(location.isSelected ? 10 : 4),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: ListTile(
          title: Text(
            'Nhà riêng',
            style: styleTitle(),
          ),
          subtitle: Text(
            location.detailLocation,
            style: TextStyle(color: kFourLightColor, fontSize: size14),
          ),
          trailing: Visibility(
            visible: location.isSelected,
            child: Icon(
              Icons.check_circle,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
