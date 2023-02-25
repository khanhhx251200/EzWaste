import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recycle_app/components/loading_widget.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/key_constant.dart';
import 'package:recycle_app/helper/ToastUtils.dart';
import 'package:recycle_app/screens/login/login2_screen.dart';
import 'package:recycle_app/screens/splash/splash_screen.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:recycle_app/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

extension ParseToString on ConnectivityResult {
  String toValue() {
    return this.toString().split('.').last;
  }
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  late AnimationController animationController;
  Animation<double>? animation;

  ConnectivityResult? _connectivityResult;
  late StreamSubscription _connectivitySubscription;
  bool? _isConnectionSuccessful;

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() async {
    final storage = FlutterSecureStorage();
    print('storage'+ storage.toString());
    final isOpened = await storage.containsKey(key: KeyConstant.KEY_FIRST_OPEN);
    if (isOpened) {
      Navigator.pushReplacementNamed(context, Login2Screen.routeName);
    } else {
      storage.write(key: KeyConstant.KEY_FIRST_OPEN, value: "true");
      Navigator.pushReplacementNamed(context, SplashScreen.routeName);
    }
  }

  @override
  void initState() {
    _checkConnectivityState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation!.addListener(() => setState(() {}));
    animationController.forward();
    super.initState();

    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print('Current connectivity status: $result');
      setState(() {
        _connectivityResult = result;
      });
    });
  }

  @override
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      print('Connected to a Wi-Fi network');
      startTime();
    } else if (result == ConnectivityResult.mobile) {
      print('Connected to a mobile network');
      startTime();
    } else {
      showToastInApp(context, 'Vui lòng kết nối Internet để sử dụng app',
          backgroundColor: kErrorColor);
      print('Not connected to any network');
    }

    setState(() {
      _connectivityResult = result;
    });
  }

  Future<void> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');

      setState(() {
        _isConnectionSuccessful = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      print(e);
      setState(() {
        _isConnectionSuccessful = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _visible
                  ? const LoadingWidget(color: kWhiteColor)
                  : const SizedBox(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo_app',
                child: Image.asset(
                  'assets/icons/logo_waste.png',
                  width: animation!.value * 250,
                  height: animation!.value * 250,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
