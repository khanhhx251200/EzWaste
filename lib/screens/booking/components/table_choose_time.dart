import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:recycle_app/components/decoration_border_shadow.dart';
import 'package:recycle_app/components/default_button.dart';
import 'package:recycle_app/components/field_note.dart';
import 'package:recycle_app/components/loading_widget.dart';
import 'package:recycle_app/core/auth_provider.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/core/constants/strings_constant.dart';
import 'package:recycle_app/models/booking_plastic.dart';
import 'package:recycle_app/screens/booking/components/booking_success.dart';
import 'package:recycle_app/services/booking_service.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TableChooseTimeBooking extends StatefulWidget {
  const TableChooseTimeBooking({Key? key}) : super(key: key);

  @override
  _TableChooseTimeBookingState createState() => _TableChooseTimeBookingState();
}

class _TableChooseTimeBookingState extends State<TableChooseTimeBooking> {
  final noteController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  BookingService bookingService = BookingService();

  final currentDate = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  bool isLoadingBooking = false;

  booking() async {
    String timeToRequest = DateFormat('yyyy-MM-dd').format(_focusedDay);
    BookingPlastic bookingPlastic = BookingPlastic(
        context.read<AuthProvider>().userInfo.address!, timeToRequest, noteController.text);
    setState(() => isLoadingBooking = true);
    bool? result = await bookingService.addBooking(bookingPlastic);
    setState(() => isLoadingBooking = false);
    if (result != null && result) {
      Navigator.pushReplacementNamed(context, BookingSuccess.routeName);
    }
  }

  checkTimeSelectedPlastic() {
    if (currentDate.weekday % 2 == 0) {
      setState(() {
        _selectedDay = DateTime(currentDate.year, currentDate.month, currentDate.day + 1);
        _focusedDay = DateTime(currentDate.year, currentDate.month, currentDate.day + 1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    checkTimeSelectedPlastic();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: size20),
        child: Column(
          children: [
            presentTime(_size, context),
            tableCalendar(),
            infoBooking(_size, context),
            inputNote(_size),
            btnBooking(_size)
          ],
        ),
      ),
    );
  }

  Container inputNote(Size _size) => Container(
      width: _size.width,
      margin: EdgeInsets.symmetric(vertical: size20),
      decoration: boxDecorationShadow(),
      child: FieldNote(textEditingController: noteController, hintText: 'Ghi chú (nếu có): ',));

  SizedBox btnBooking(Size _size) {
    return SizedBox(
      width: _size.width,
      child: isLoadingBooking
          ? LoadingWidget(color: kPrimaryColor)
          : DefaultButton(text: kBooking + ' ngay', press: () => booking()),
    );
  }

  Container infoBooking(Size _size, BuildContext context) {
    return Container(
      width: _size.width,
      margin: EdgeInsets.symmetric(vertical: size20),
      padding: EdgeInsets.all(size8),
      decoration: boxDecorationShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: size8),
            child: Text(
              '$kTimeBooking: ',
              style: TextStyle(color: kSecondaryTextColor),
            ),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.clock,
                size: size14,
                color: kPrimaryColor,
              ),
              SizedBox(width: size8),
              Text(convertDateToString(_selectedDay),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: size16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: size8),
            child: Text(
              '$kAddress: ',
              style: TextStyle(color: kSecondaryTextColor),
            ),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.houseUser,
                size: size14,
                color: kPrimaryColor,
              ),
              SizedBox(width: size8),
              Text(context.read<AuthProvider>().userInfo.address!,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: size16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Container presentTime(Size _size, BuildContext context) {
    return Container(
      width: _size.width,
      margin: EdgeInsets.symmetric(vertical: size20),
      padding: EdgeInsets.all(size8),
      decoration: boxDecorationShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: size8),
            child: Text(
              '$kPresentTime: ',
              style: TextStyle(color: kSecondaryTextColor),
            ),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.clock,
                size: size14,
                color: kPrimaryColor,
              ),
              SizedBox(width: size8),
              Text(convertDateToString(currentDate),
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: size16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Container tableCalendar() {
    return Container(
      decoration: boxDecorationShadow(),
      child: TableCalendar(
        currentDay: currentDate,
        locale: 'vi-VN',
        firstDay: currentDate,
        lastDay: DateTime(currentDate.year + 5),
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekVisible: true,
        calendarFormat: _calendarFormat,
        onFormatChanged: (CalendarFormat format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        focusedDay: _focusedDay,
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

        enabledDayPredicate: (DateTime date) {
          return date.weekday % 2 != 0;
        },

        //Day change
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          print('selected: ' + selectedDay.toString());
          print('focusedDay: ' + focusedDay.toString());
        },
        selectedDayPredicate: (DateTime date) {
          return isSameDay(_selectedDay, date);
        },

        //To style the calendar
        calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration:
                BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
            todayDecoration: BoxDecoration(
                color: kSecondaryTextColor, shape: BoxShape.circle)),
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
            weekendStyle: TextStyle(fontWeight: FontWeight.bold)),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          formatButtonTextStyle: TextStyle(color: kPrimaryColor),
          titleTextStyle: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: size16),
        ),
      ),
    );
  }

}
