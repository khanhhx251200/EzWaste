import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/title_page.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/home/activities/components/body.dart';
import 'package:shop_app/screens/home/activities/provider/activities_provider.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ActivitiesProvider>(
        builder: (context, provider, child) {
          return Container(
            color: kWhiteColor,
            child: Column(
              children:  [
                const TitlePage(title: kMyChart),
                Expanded(child: Body(provider: provider,))
              ],
            ),
          );
        },
      ),
    );
  }
}
