import 'package:flutter/material.dart';
import 'package:recycle_app/components/loading_widget.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/screens/new_design/dashboash/activities/provider/activities_provider.dart';

import 'detail_activities.dart';
import 'filter_activities.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.provider}) : super(key: key);
  final ActivitiesProvider provider;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    widget.provider.getStatistic();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(size32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FilterActivities(),
            const SizedBox(height: size36),
            widget.provider.statisticBooking == null
                ? LoadingWidget(color: kPrimaryColor)
                : DetailActivities(
                    provider: widget.provider,
                  )
          ],
        ),
      ),
    );
  }
}
