import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/routes.dart';
import 'package:recycle_app/screens/new_design/confirm_booking/provider/confirm_provider.dart';
import 'package:recycle_app/screens/new_design/dashboash/activities/provider/activities_provider.dart';
import 'package:recycle_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:recycle_app/screens/new_design/dashboash/home/provider/home_page_provider.dart';
import 'package:recycle_app/screens/welcome/welcome_screen.dart';
import 'package:recycle_app/services/local_notification_service.dart';
import 'package:recycle_app/services/notification.dart';
import 'package:recycle_app/theme.dart';

final FlutterLocalNotificationsPlugin localNotifications =
    FlutterLocalNotificationsPlugin();
// Uses rxdart/subjects to trigger showing a different page in your app from an async handler
final StreamController<String> selectNotificationSubject =
    StreamController<String>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("message data: " + message.data.toString());
  print("message title: " + message.notification!.title!);
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await init();


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ChangeNotifierProvider(create: (_) => BookingProvider()),
      ChangeNotifierProvider(create: (_) => ConfirmProvider()),
      ChangeNotifierProvider(create: (_) => ActivitiesProvider()),
    ],
    child: MyApp(),
  ));
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await LocalNotificationService.initialize();

  final firebaseMessaging = FCM();
  firebaseMessaging.setNotifications();
  firebaseMessaging.getToken();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Ez Waste',
      theme: theme(),
      initialRoute: WelcomeScreen.routeName,
      // initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
