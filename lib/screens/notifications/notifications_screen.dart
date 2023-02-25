import 'package:flutter/material.dart';
import 'package:recycle_app/components/function_in_development.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/notifications/components/list_notification.dart';

class NotificationsScreen extends StatefulWidget {
  static String routeName = "/notifications";

  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: Text(kNotifications,
            style: TextStyle(
                fontSize: size16,
                fontWeight: FontWeight.bold,
                color: kBlackColor)),
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever, color: kGreyColor))
        // ],
      ),
      body: SafeArea(
          child: Container(
        child: Notifications(),
      )),
    );
  }
}
