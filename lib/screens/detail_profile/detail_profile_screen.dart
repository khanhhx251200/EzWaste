import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';

import 'components/preview_user.dart';

class DetailProfileScreen extends StatelessWidget {
  static final String routeName = '/profile';

  const DetailProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kWhiteColor,
        ),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const Text('Thông tin cá nhân',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      backgroundColor: kPrimaryColor,
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  PreviewUser(fullName: provider.userInfo!.fullName,userName: provider.userInfo!.userName!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: size8, horizontal: size14),
                    child: Row(
                      children: [
                        Text('Họ và tên', style: TextStyle(color: kBlackColor))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

