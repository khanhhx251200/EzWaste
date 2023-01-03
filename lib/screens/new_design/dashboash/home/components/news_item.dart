import 'package:flutter/material.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size16),
      decoration: boxDecorationShadow(),
      child: ListTile(
        leading: Image.asset('assets/images/demo_news.png'),
        title: Text(
          'Tái chế là gì? Các cách tái chế rác tại',
          style: TextStyle(
            fontSize: size14,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
            'Giải thích tái chế là gì và có lợi ích gì đối với cuộc sống? Những loại phế liệu nào có thể tái chế lại được? Cùng bỏ túi những thông tin này ngay trong bài viết dưới nhé!',
            style: TextStyle(
              fontSize: size12,
            )),
      ),
    );
  }
}
