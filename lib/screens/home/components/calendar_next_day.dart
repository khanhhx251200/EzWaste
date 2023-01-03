import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shop_app/screens/home/components/list_order_by_date.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';

class CalendarNextDays extends StatefulWidget {
  const CalendarNextDays({Key? key, required this.provider}) : super(key: key);
  final HomeProvider provider;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarNextDays> {
  final _currentDate = DateTime.now();
  final dates = <DateTime>[];
  DateTime dateTimeSelected = DateTime.now();
  dynamic color;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateTimeSelected = _currentDate.add(Duration(days: 0));
    widget.provider.setDateTimeSelected(dateTimeSelected);
    for (int i = 0; i < 60; i++) {
      final DateTime date = _currentDate.add(Duration(days: i));
      if (i == 0) {
        color = date.weekday % 2 == 0 ? kOrganicColor : kPlasticColor;
      }
      dates.add(date);
    }
  }

  GestureDetector itemDate(DateTime date) {
    final _weekdayFormatter = DateFormat.EEEE('vi');
    final _dateFormatter = DateFormat('dd/MM/yyyy');
    final colors;
    if (date.weekday == 1 || date.weekday == 3 || date.weekday == 5 || date.weekday == 7) {
      colors = kPlasticColor;
    } else {
      colors = kOrganicColor;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.provider.setDateTimeSelected(date);
          color = date.weekday % 2 == 0 ? kOrganicColor : kPlasticColor;
        });
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: size8),
        decoration: BoxDecoration(
          color: widget.provider.dateTimeSelected == date ? colors : kBackgroundColor,
          borderRadius: BorderRadius.circular(size18),
          border:
          date.day == DateTime
              .now()
              .day ? Border.all(color: colors) : null,
          // boxShadow: [
          //   BoxShadow(
          //     color: kGreyColor.withOpacity(0.5),
          //     spreadRadius: 2,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weekdayFormatter.format(date),
              style: TextStyle(
                color: widget.provider.dateTimeSelected == date ? kWhiteColor : kTextFieldColor,
              ),
            ),
            SizedBox(height: size8),
            Text(
              _dateFormatter.format(date),
              style: TextStyle(
                  color:
                  widget.provider.dateTimeSelected == date ? kWhiteColor : kTextFieldColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: size8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lịch thu gom',
                style: TextStyle(
                    color: kTextFieldColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          listNextDates(),
          Expanded(child: ListOrderByDate(color: color, provider: widget.provider))
        ],
      ),
    );
  }

  // Container listOrderByDate() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: size8),
  //     child: ,
  //   );
  // }

  Container listNextDates() {
    return Container(
      height: 80,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: dates.length,
        itemBuilder: (BuildContext context, int index) {
          final element = dates[index];
          return itemDate(element);
        },
      ),
    );
  }
}

