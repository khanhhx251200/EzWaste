import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';

class WeatherAndDateNow extends StatelessWidget {
  const WeatherAndDateNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: size12, vertical: size12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          boxContent(Icons.cloud_rounded, "16°C"),
          boxContent(Icons.calendar_today, convertDateToString(DateTime.now())),
        ],
      ),
    );
  }

  Container boxContent(IconData icon, String content) {
    return Container(
          padding: EdgeInsets.symmetric(
              horizontal: size8, vertical: size8 / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(size14) //
              ),
              border: Border.all(color: Colors.blueGrey)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.blueGrey,
                    size: size16,
                  ),
                  SizedBox(width: size8/2,),
                  Text(content),
                ],
              )
            ],
          ),
        );
  }
}
