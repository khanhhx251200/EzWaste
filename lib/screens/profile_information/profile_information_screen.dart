import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/components/input_disable.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/sign_out/sign_out.dart';
import 'package:recycle_app/size_config.dart';

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
      width: _size.width,
      child: DefaultButton(
        color: kErrorColor,
        press: () => openSignOutDrawer(context),
        text: kLogOut,
        radius: size12,
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
}
