import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/loading_widget.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/login/login2_screen.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/services/local_notification_service.dart';
import 'package:shop_app/services/notification.dart';
import 'package:shop_app/services/share_preferences_service.dart';
import 'package:shop_app/size_config.dart';
import 'package:provider/provider.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Chào mừng bạn đến với Veca!",
      "image": "assets/images/splash_1.svg"
    },
    {
      "text":
          "Chúng tôi giúp mọi người kết nối \nvới cửa hàng trên khắp Việt Nam",
      "image": "assets/images/splash_2.svg"
    },
    {
      "text":
          "Chúng tôi chỉ cho bạn cách mua bán dễ dàng. \nChỉ cần ở nhà với chúng tôi",
      "image": "assets/images/splash_3.svg"
    },
  ];

  final _prefs = PreferencesService();
  bool _isLogin = false;

  @override
  void initState() {
    super.initState();

    LocalNotificationService.initialize(context);

    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();
    firebaseMessaging.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Hero(
                        tag: 'logo_app',
                        child: Image.asset('assets/icons/logo_waste.png')))),
            Expanded(
              flex: 3,
              child: CarouselSlider(
                  items: List.generate(
                    splashData.length,
                    (index) {
                      return SplashContent(
                        image: splashData[index]["image"],
                        text: splashData[index]['text'],
                      );
                    },
                  ),
                  options: CarouselOptions(
                    height: 280.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 0.8,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              splashData.length,
                              (index) {
                                return buildDot(index: index);
                              },
                            ),
                          ),
                        ),
                        _isLogin
                            ? Center(
                                child: LoadingWidget(color: kPrimaryColor),
                              )
                            : TextButton(
                                onPressed: () async {
                                  newScreenLogin();
                                  // await handleLogin(context);
                                },
                                child: Text(
                                  kStart,
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: size16,
                                      fontWeight: FontWeight.bold),
                                )),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Container> buttonLogin(BuildContext context) async {
    return Container(
      height: getProportionateScreenHeight(48),
      child: DefaultButton(
        text: kStart.toUpperCase(),
        press: () async {
          await handleLogin(context);
        },
      ),
    );
  }

  newScreenLogin() {
    Navigator.pushReplacementNamed(context, Login2Screen.routeName);
  }

  Future<void> handleLogin(BuildContext context) async {
    setState(() => _isLogin = true);

    String? token = await _prefs.getToken();
    int? time = await _prefs.getTimeExprise();
    print("token BE: $token");
    if (token!.isNotEmpty && time! > DateTime.now().millisecondsSinceEpoch) {
      await context.read<HomeProvider>().getUserInfo();
      if (context.read<HomeProvider>().userInfo != null) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        setState(() => _isLogin = false);
      }
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
    setState(() => _isLogin = false);
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: size8),
      height: 6,
      width: currentPage == index ? 24 : size8,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
