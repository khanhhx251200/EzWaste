import 'package:flutter/material.dart';
import 'package:recycle_app/models/history_response.dart';

class ConfirmProvider extends ChangeNotifier {

  Order? _order;

  Order? get order => _order;

}