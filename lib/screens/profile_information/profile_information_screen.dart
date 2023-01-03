import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/input_disable.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/size_config.dart';

class ProfileInformationScreen extends StatelessWidget {
  static String routeName = "/profile_information";

  const ProfileInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kFiveColor,
      appBar: AppBar(
        backgroundColor: kFiveColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: kWhiteColor,
              size: size20,
            )),
        title: Text(
          kProfile,
          style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SafeArea(
            child: Column(
          children: [
            header(context, _size),
            Expanded(child: formInformation(context, _size)),
          ],
        )),
      ),
    );
  }

  SizedBox buttonLogout(Size _size, BuildContext context) {
    return SizedBox(
      height: 64,
      width: _size.width,
      child: DefaultButton(
        color: kErrorColor,
        press: () => _openSignOutDrawer(context),
        text: kLogOut,
      ),
    );
  }

  Container formInformation(BuildContext context, Size _size) {
    final userInfo = Provider.of<AuthProvider>(context).userInfo;
    return Container(
      padding: EdgeInsets.all(size36),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size20 * 2),
              topRight: Radius.circular(size20 * 2))),
      child: Column(
        children: [
          InputDisable(
            hintText: kPhone,
            valueText: userInfo.userName!,
          ),
          InputDisable(
            hintText: kSex,
            valueText: userInfo.gender == 1 ? 'Nam' : 'Nữ',
          ),
          InputDisable(
            hintText: kAddress,
            valueText: userInfo.address!,
          ),
          Spacer(),
          buttonLogout(_size, context),
        ],
      ),
    );
  }

  Padding header(BuildContext context, Size _size) {
    final userInfo = Provider.of<AuthProvider>(context).userInfo;
    return Padding(
      padding: const EdgeInsets.all(size8),
      child: Column(
        children: [
          CircleAvatar(
            radius: _size.height * 0.07,
            backgroundColor: kWhiteColor,
            child: CircleAvatar(
              radius: _size.height * 0.067,
              child: Image.asset(
                'assets/images/Profile Image.png',
                height: _size.height * 0.2,
                width: _size.width * 0.3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: size12),
            child: Text(
              userInfo.fullName,
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: size20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  logout(BuildContext context) async {
    bool resLogout = await context.read<AuthProvider>().logout(context);
    print('đăng xuất: ' + resLogout.toString());
  }

  void _openSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kPrimaryColor,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
              top: size8,
              bottom: 0,
              left: 24,
              right: 24,
            ),
            height: getProportionateScreenHeight(150),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: context.read<AuthProvider>().userInfo.fullName,
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: size18,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                    text: ", bạn có chắc chắn muốn đăng xuất không?",
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: size16,
                        fontWeight: FontWeight.w300),
                  )
                ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          logout(context);
                        },
                        color: Colors.white,
                        child: Text(
                          kLogOut,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(size20)),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderSide: BorderSide(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Ở lại",
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
