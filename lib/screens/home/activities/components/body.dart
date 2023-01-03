import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/size_constants.dart';

import 'detail_activities.dart';
import 'filter_activities.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(size32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  const [
            FilterActivities(),
            SizedBox(height: size36),
            DetailActivities()
          ],
        ),
      ),
    );
  }
}

