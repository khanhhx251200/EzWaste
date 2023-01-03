import 'package:flutter/material.dart';
import 'package:shop_app/models/notication.dart';
import 'package:shop_app/screens/notifications/components/notification.dart';
import 'package:shop_app/services/user_service.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final UserService _userService = UserService();
  late Future<List<NotificationModel>> getListNotification;

  Future<List<NotificationModel>> getNotifications() async {
    return await _userService.getNotifications();
  }

  @override
  void initState() {
    getListNotification = getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotificationModel>>(
      future: getListNotification,
      builder: (BuildContext context,
          AsyncSnapshot<List<NotificationModel>> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          final listNotification = snapshot.data ?? [];
          print('listNoti: ' + listNotification.toString());
          return listNotification.length == 0
              ? Center(child: Text('Không có lịch thu gom'))
              : ListView.builder(
                  itemCount: listNotification.length,
                  itemBuilder: (context, index) {
                    final NotificationModel element = listNotification[index];
                    return NotificationItem(
                      notification: element,
                    );
                  },
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
