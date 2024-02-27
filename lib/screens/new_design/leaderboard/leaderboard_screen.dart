import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/leaderboard/components/top_3.dart';

class LeaderBoardScreen extends StatelessWidget {
  static final String routeName = "/leaderboard";

  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: kWhiteColor,
        ),
        title: Text(
          kLeaderboard,
          style: TextStyle(fontSize: size18),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          TopLeaderBoard(),
          SizedBox(
            height: size8,
          ),
          Expanded(child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(size16),
                padding: EdgeInsets.all(size8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(size12),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: size8,
                        spreadRadius: -2),
                  ],
                ),
                child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${index + 3}",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: size12,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/user_empty.png"),
                        radius: size32,
                      ),
                    ],
                  ),
                  title: Text(
                    "Hoàng Xuân Khánh",
                    style: TextStyle(
                        color: kTextColor, fontWeight: FontWeight.w700),
                  ),
                  trailing: Text(
                    "222 kg",
                    style: TextStyle(
                        color: kTextColor, fontWeight: FontWeight.w700),
                  ),
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}
