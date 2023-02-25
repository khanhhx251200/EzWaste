import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class RankInAccount extends StatelessWidget {
  const RankInAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size8),
      padding:
      EdgeInsets.symmetric(vertical: size16, horizontal: size8),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_silver.jpg"),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(size8))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hạng bạc',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: size12,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: size12,
                    )
                  ],
                ),
                SizedBox(
                  height: size8,
                ),
                Text(
                  '7749 điểm nữa để lên Vàng',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kTextColor,
                      fontSize: size12),
                ),
              ],
            ),
          ),
          Image.asset("assets/images/crown_silver.png", width: 48, height: 48,)
        ],
      ),
    );
  }
}
