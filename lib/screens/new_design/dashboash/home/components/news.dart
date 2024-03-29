import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/dashboash/home/components/news_list.dart';
import 'package:recycle_app/screens/new_design/detail_booking/detail_booking_screen.dart';
import 'package:recycle_app/services/local_notification_service.dart';

class News extends StatefulWidget {
  const News({
    Key? key,
  }) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size8, horizontal: size20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                kNews,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: size20),
              ),
              TextButton(
                  onPressed: () => LocalNotificationService.addNotification(
                      "Test",
                      "hehe",
                      DateTime.now().millisecondsSinceEpoch + 100,
                      'testing'),
                  child: Text(
                    kSeeMore,
                    style: TextStyle(color: kGreyColor),
                  )),
            ],
          ),
          NewsList()
        ],
      ),
    );
  }
}
