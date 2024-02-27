import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzData;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        "recycle_app",
        "recycle_app channel",
        channelDescription: "this is our channel",
        importance: Importance.max,
        priority: Priority.high,
      ));

  static Future<void> initialize() async {
    tzData.initializeTimeZones();
    // #1
    const androidSetting = AndroidInitializationSettings('app_icon');
    const iosSetting = IOSInitializationSettings();

    // #2
    const initSettings =
        InitializationSettings(android: androidSetting, iOS: iosSetting);

    // #3
    await _notificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }

  static void display(RemoteMessage message) async {
    print('display Message: $message');
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  static addNotification(
      String title, String content, int endTime, String channel) async {

    final scheduleTime =
        tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local, endTime);

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      content,
      scheduleTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  void cancelAllNotification() {
    _notificationsPlugin.cancelAll();
  }
}
