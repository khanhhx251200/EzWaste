import 'package:flutter/material.dart';
import 'package:recycle_app/screens/new_design/dashboash/home/components/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return NewsItem();
      },
    );
  }
}
