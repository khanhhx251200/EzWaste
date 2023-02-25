import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/components/title_page.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/screens/new_design/dashboash/activities/components/body.dart';
import 'package:recycle_app/screens/new_design/dashboash/activities/provider/activities_provider.dart';

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
