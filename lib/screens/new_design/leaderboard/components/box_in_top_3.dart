import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/models/leaderboard.dart';

class BoxInTop3 extends StatelessWidget {
  const BoxInTop3({
    Key? key,
    required this.leaderboard,
  }) : super(key: key);
  final Leaderboard leaderboard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(leaderboard.topRank == 1 ? size24 : size12),
          margin: EdgeInsets.symmetric(horizontal: size8),
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(size8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(leaderboard.imageUrl),
                radius: size32,
              ),
              SizedBox(
                height: size8,
              ),
              Text(
                "Nguyễn Hoàng Kim Ngân",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: size8,
              ),
              Text(
                "30.20 kg",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 10,
          child: Image.asset(
            imageByTopRank(),
            width: size40,
            height: size40,
          ),
        ),
      ],
    );
  }

  String imageByTopRank() {
    if (leaderboard.topRank == 1) {
      return "assets/images/crown.png";
    } else if (leaderboard.topRank == 2) {
      return "assets/images/rank_2.png";
    }
    return "assets/images/rank_3.png";
  }
}
