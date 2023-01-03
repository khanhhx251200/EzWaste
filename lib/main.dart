import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/edit_profile/provider/edit_profile_provider.dart';
import 'package:shop_app/screens/history/provider/evaluate_provider.dart';
import 'package:shop_app/screens/history/provider/history_provider.dart';
import 'package:shop_app/screens/home/activities/provider/activities_provider.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/learderboard/provider/leaderboard_provider.dart';
import 'package:shop_app/screens/new_design/confirm_booking/provider/confirm_provider.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:shop_app/screens/sell/sell_provider.dart';
import 'package:shop_app/screens/welcome/welcome_screen.dart';
import 'package:shop_app/theme.dart';

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
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ChangeNotifierProvider(create: (_) => SellProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => EditProfileProvider()),
      ChangeNotifierProvider(create: (_) => EvaluateProvider()),
      ChangeNotifierProvider(create: (_) => LeaderBoardProvider()),
      ChangeNotifierProvider(create: (_) => ActivitiesProvider()),
      ChangeNotifierProvider(create: (_) => BookingProvider()),
      ChangeNotifierProvider(create: (_) => ConfirmProvider()),
    ],
    child: MyApp(),
  ));
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
