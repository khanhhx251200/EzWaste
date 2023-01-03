import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';

class PreviewUser extends StatelessWidget {
  const PreviewUser({
    Key? key, required this.fullName, required this.userName,
  }) : super(key: key);
  final String fullName;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: const AssetImage('assets/images/Profile Image.png'),
      ),
      title: Text(fullName, style: const TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),),
      subtitle: Text(userName, style: const TextStyle(color: kWhiteColor)),
    );
  }
}
