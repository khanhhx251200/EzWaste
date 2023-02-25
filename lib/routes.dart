import 'package:flutter/widgets.dart';
import 'package:recycle_app/screens/action_booking/components/access_booking.dart';
import 'package:recycle_app/screens/action_booking/components/confirm_booking_success.dart';
import 'package:recycle_app/screens/action_booking/components/refuse_booking_screen.dart';
import 'package:recycle_app/screens/booking/booking_screen.dart';
import 'package:recycle_app/screens/booking/components/body_booking.dart';
import 'package:recycle_app/screens/booking/components/booking_success.dart';
import 'package:recycle_app/screens/change_password/change_password_screen.dart';
import 'package:recycle_app/screens/change_password/components/change_password_success.dart';
import 'package:recycle_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:recycle_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:recycle_app/screens/login/login2_screen.dart';
import 'package:recycle_app/screens/new_design/confirm_booking/confirm_booking_screen.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/account_screen.dart';
import 'package:recycle_app/screens/new_design/dashboash/account/components/wallet/my_wallet/my_wallet_screen.dart';
import 'package:recycle_app/screens/new_design/dashboash/activities/components/filter_calendar.dart';
import 'package:recycle_app/screens/new_design/dashboash/dashboash_screen.dart';
import 'package:recycle_app/screens/new_design/detail_booking/detail_booking_screen.dart';
import 'package:recycle_app/screens/notifications/notifications_screen.dart';
import 'package:recycle_app/screens/otp/otp_screen.dart';
import 'package:recycle_app/screens/profile/profile_screen.dart';
import 'package:recycle_app/screens/profile_information/profile_information_screen.dart';
import 'package:recycle_app/screens/sign_in/sign_in_screen.dart';
import 'package:recycle_app/screens/splash/splash_screen.dart';
import 'package:recycle_app/screens/welcome/welcome_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  Login2Screen.routeName: (context) => Login2Screen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  NotificationsScreen.routeName: (context) => NotificationsScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  ChangePasswordSuccess.routeName: (context) => ChangePasswordSuccess(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  BookingScreen.routeName: (context) => BookingScreen(),
  BookingSuccess.routeName: (context) => BookingSuccess(),
  ProfileInformationScreen.routeName: (context) => ProfileInformationScreen(),
  RefuseBookingScreen.routeName: (context) => RefuseBookingScreen(),
  AccessBookingScreen.routeName: (context) => AccessBookingScreen(),
  ConfirmBookingSuccess.routeName: (context) => ConfirmBookingSuccess(),
  FilterCalendar.routeName: (context) => const FilterCalendar(),
  DashBoardScreen.routeName: (context) => const DashBoardScreen(),
  ConfirmBookingScreen.routeName: (context) => const ConfirmBookingScreen(),
  DetailBookingScreen.routeName: (context) => const DetailBookingScreen(),
  BodyBooking.routeName: (context) => const BodyBooking(),
  AccountScreen.routeName: (context) => const AccountScreen(),
  MyWalletScreen.routeName: (context) => const MyWalletScreen(),
};
