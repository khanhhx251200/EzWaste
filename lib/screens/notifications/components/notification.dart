import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/notication.dart';
import 'package:shop_app/screens/notifications/components/icon_notification.dart';
import 'package:shop_app/screens/notifications/detail_notification/detail_notification_screen.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailNotification(
                    notification: notification,
                  ))),
      leading: IconNotification(
        radius: 24,
      ),
      title: buildTitle(),
      subtitle: Text(convertTimeStampToStringDetail(notification.createDate)),
    );
  }

  Column buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size8 / 2),
        Row(
          children: [
            Expanded(
              child: Text(
                notification.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size14,
                    color: kBlackColor),
              ),
            ),
            SizedBox(width: size8),
            Container(
              height: size8,
              width: size8,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kThirdColor),
            ),
          ],
        ),
        SizedBox(height: size8),
      ],
    );
  }
}
