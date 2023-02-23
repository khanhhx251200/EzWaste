import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/notifications/components/icon_notification.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    final size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildBackground(shrinkOffset, context),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) {
    return Opacity(
      opacity: appear(shrinkOffset),
      child: Container(
        color: kPrimaryColor,
      ),
    );
  }

  Widget buildBackground(double shrinkOffset, BuildContext context) =>
      Opacity(
        opacity: disappear(shrinkOffset),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
              bottomLeft: Radius.circular(60),
            ),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg_silver.jpg'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios_new)),
                    Center(child: Text(kMyWallet)),
                    SvgPicture.asset(
                      'assets/icons/cash.svg',
                      color: kWhiteColor,
                    )
                  ],
                ),
              ),
            )),
      );

  Widget buildFloating(double shrinkOffset) =>
      Opacity(
        opacity: disappear(shrinkOffset),
        child: Column(
          children: [
            IconNotification(radius: 32),
            Text('Offer', style: TextStyle(fontSize: 20)),
          ],
        ),
      );

  Widget buildButton({
    required String text,
    required IconData icon,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 20)),
          ],
        ),
        onPressed: () {},
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
