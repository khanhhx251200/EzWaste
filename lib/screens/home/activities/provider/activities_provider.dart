import 'package:flutter/material.dart';

class ActivitiesProvider extends ChangeNotifier {
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  DateTime? get rangeStart => _rangeStart;
  DateTime? get rangeEnd => _rangeEnd;

  setRangeStart(DateTime? dateTime) => _rangeStart = dateTime;
  setRangeEnd(DateTime? dateTime) => _rangeEnd = dateTime;
}