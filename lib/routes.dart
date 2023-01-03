import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/booking/booking_screen.dart';
import 'package:shop_app/screens/booking/components/body_booking.dart';
import 'package:shop_app/screens/booking/components/booking_success.dart';
import 'package:shop_app/screens/change_password/change_password_screen.dart';
import 'package:shop_app/screens/change_password/components/change_password_success.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/history/components/agree_order_fragment.dart';
import 'package:shop_app/screens/history/components/confirm_order.dart';
import 'package:shop_app/screens/history/components/confirm_order_success.dart';
import 'package:shop_app/screens/history/components/detail_complete.dart';
import 'package:shop_app/screens/history/components/refuse_fragment.dart';
import 'package:shop_app/screens/history/evaluate/evaluate_screen.dart';
import 'package:shop_app/screens/history/components/rating_order_screen.dart';
import 'package:shop_app/screens/history/history_screen.dart';
import 'package:shop_app/screens/home/activities/components/filter_calendar.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/learderboard/leaderboard_screen.dart';
import 'package:shop_app/screens/login/login2_screen.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/screens/new_design/confirm_booking/confirm_booking_screen.dart';
import 'package:shop_app/screens/new_design/dashboash/dashboash_screen.dart';
import 'package:shop_app/screens/new_design/detail_booking/detail_booking_screen.dart';
import 'package:shop_app/screens/notifications/notifications_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/profile_information/profile_information_screen.dart';
import 'package:shop_app/screens/sell/sell_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/welcome/welcome_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  Login2Screen.routeName: (context) => Login2Screen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  NotificationsScreen.routeName: (context) => NotificationsScreen(),
  SellScreen.routeName: (context) => SellScreen(),
  HistoryScreen.routeName: (context) => HistoryScreen(),
  DetailComplete.routeName: (context) => DetailComplete(),
  LeaderboardScreen.routeName: (context) => LeaderboardScreen(),
  RatingOrderScreen.routeName: (context) => RatingOrderScreen(),
  EvaluateScreen.routeName: (context) => EvaluateScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  ChangePasswordSuccess.routeName: (context) => ChangePasswordSuccess(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  BookingScreen.routeName: (context) => BookingScreen(),
  BookingSuccess.routeName: (context) => BookingSuccess(),
  ProfileInformationScreen.routeName: (context) => ProfileInformationScreen(),
  RefuseBookingScreen.routeName: (context) => RefuseBookingScreen(),
  AccessBookingScreen.routeName: (context) => AccessBookingScreen(),
  ConfirmOrder.routeName: (context) => ConfirmOrder(),
  ConfirmOrderSuccess.routeName: (context) => ConfirmOrderSuccess(),
  FilterCalendar.routeName: (context) => const FilterCalendar(),
  DashBoardScreen.routeName: (context) => const DashBoardScreen(),
  ConfirmBookingScreen.routeName: (context) => const ConfirmBookingScreen(),
  DetailBookingScreen.routeName: (context) => const DetailBookingScreen(),
  BodyBooking.routeName: (context) => const BodyBooking(),
};
