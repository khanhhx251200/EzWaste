import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/notication.dart';
import 'package:shop_app/screens/notifications/components/list_notification.dart';
import 'package:shop_app/screens/notifications/detail_notification/components/custom_appbar_advance.dart';
import 'package:shop_app/screens/notifications/detail_notification/components/title_notification.dart';
import 'package:shop_app/size_config.dart';

class DetailNotification extends StatefulWidget {
  static String routeName = "/detail-notifications";

  const DetailNotification({Key? key,required this.notification}) : super(key: key);
  final NotificationModel notification;

  @override
  _DetailNotificationState createState() => _DetailNotificationState();
}

class _DetailNotificationState extends State<DetailNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông báo',
          style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverPersistentHeader(
            //     pinned: true,
            //     delegate: CustomSliverAppBarDelegate(expandedHeight: 100)),

            DetailNotificaion(
                title: widget.notification.content,
                subTitle: convertTimeStampToStringDetail(widget.notification.createDate)),
          ],
        ),
      ),
    );
  }
}
