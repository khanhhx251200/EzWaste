import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home/components/calendar_next_day.dart';
import 'package:shop_app/screens/home/components/sold_garbage.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Column(
            children: [
              SoldGarbage(),
              Expanded(child: CalendarNextDays(provider: provider)),
            ],
          ),
        );
      },
    );
  }


}
