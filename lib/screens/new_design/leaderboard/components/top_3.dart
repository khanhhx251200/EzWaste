import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/models/leaderboard.dart';
import 'package:recycle_app/screens/new_design/leaderboard/components/box_in_top_3.dart';

class TopLeaderBoard extends StatelessWidget {
  const TopLeaderBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size16, vertical: size32),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(size40))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: BoxInTop3(
                leaderboard: new Leaderboard(
                    imageUrl: "assets/images/user_empty.png",
                    fullName: "Hoàng Xuân Khánh",
                    topRank: 2,
                    total: 202),
              )),
          Expanded(
              child: BoxInTop3(
                leaderboard: new Leaderboard(
                    imageUrl: "assets/images/profile.png",
                    fullName: "Hoàng Xuân Hải",
                    topRank: 1,
                    total: 322),
              )),
          Expanded(
              child: BoxInTop3(
                leaderboard: new Leaderboard(
                    imageUrl: "assets/images/Profile Image.png",
                    fullName: "Hoàng Khánh Linh",
                    topRank: 3,
                    total: 122),
              )),
        ],
      ),
    );
  }
}
