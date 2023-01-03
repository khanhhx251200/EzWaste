import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class DetailNotificaion extends StatelessWidget {
  const DetailNotificaion(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return buildSliverToBoxAdapter();
  }

  SliverToBoxAdapter buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListTile(
            title: Text(subTitle,
                style:
                    TextStyle(fontSize: size12, color: kSecondaryTextColor)),
            subtitle: Text(title,
                style: TextStyle(fontSize: size20, color: kPrimaryColor)),
          ),
          // image(0),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: size14),
          //   child: Text(
          //     "Đã đến lúc khuấy động mùa lễ Noel bằng chút kỳ diệu cùng chúng tôi. Quà lớn quà nhỏ. bạn muốn tặng ai, cứ bày tỏ! VECO sẽ biến món quà trở thành sự thật trong chương trình Noel - 2022 Món quà!",
          //     style: TextStyle(),
          //   ),
          // ),
        ],
      ),
    );
  }

  customViews() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => image(index),
        childCount: 20,
      ),
    );
  }

  Container image(int index) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      child: Card(
        child: Image.network(
          'https://source.unsplash.com/random?sig=$index',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
