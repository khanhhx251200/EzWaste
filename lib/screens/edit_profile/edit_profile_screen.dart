import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/auth_provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/screens/edit_profile/components/form_edit_profile.dart';
import 'package:shop_app/screens/edit_profile/provider/edit_profile_provider.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/size_config.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = "/edit_profile";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final double coverHeight = 120;
  final double profileHeight = 100;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<EditProfileProvider>().setIsEditUser(false);
    getInfo();
    super.initState();
  }

  getInfo() async {
    context
        .read<EditProfileProvider>()
        .setUserInfo(context.read<HomeProvider>().userInfo!);
    await context.read<EditProfileProvider>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(
      builder: (context, provider, child) => WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kWhiteColor,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_sharp)),
            title: Text('Thông tin cá nhân',
                style: TextStyle(color: kBlackColor)),
          ),
          backgroundColor: kWhiteColor,
          body: provider.userInfo != null
              ? GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SafeArea(
                    child: ListView(
                      children: <Widget>[
                        buildContent(provider),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ),
      ),
    );
  }

  Widget buildContent(EditProfileProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(size8)),
          Text(provider.userInfo!.fullName,
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: getProportionateScreenHeight(size14)),
          Text(provider.userInfo != null ? provider.userInfo!.userName! : '',
              style: TextStyle(color: kTextColor)),
          SizedBox(height: getProportionateScreenHeight(size14)),
          Form(
            key: _formKey,
            child: FormEditProfile(
              provider: provider,
            ),
          ),
        ],
      ),
    );
  }

  Row infoUser(String title, String value) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(title),
        )),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(thickness: 1),
                Text(value),
              ],
            )),
      ],
    );
  }

  Widget buildProfileImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: kWhiteColor,
          child: CircleAvatar(
            radius: (profileHeight / 2) - 4,
            backgroundColor: kGreyColor.shade800,
            backgroundImage: AssetImage("assets/images/user_empty.png"),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: CircleAvatar(
            radius: 12,
            child: Icon(
              Icons.edit_outlined,
              color: kWhiteColor,
              size: size16,
            ),
            backgroundColor: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
