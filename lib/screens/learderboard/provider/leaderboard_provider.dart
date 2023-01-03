import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/leaderboard.dart';
import 'package:shop_app/services/leader_board_service.dart';

class LeaderBoardProvider extends ChangeNotifier {
  final LeaderBoardService _leaderBoardService = new LeaderBoardService();
  dynamic _currentColor = kOrganicColor;
  List<Leaderboard> _listLeaderBoard = [];
  String _typeRecycle = ORGANIC;
  String _typeDate = DAY;


  setCurrentColor(color) => _currentColor = color;

  setTypeRecycle(String type) => _typeRecycle = type;

  setTypeDate(String type) => _typeDate = type;

  setListLeaderBoard(List<Leaderboard> listLeaderBoard) => _listLeaderBoard = listLeaderBoard;

  get currentColor => _currentColor;

  get listLeaderBoard => _listLeaderBoard;

  getList() async {
    _listLeaderBoard = [];
    print('typeDate '+ _typeDate);
    print('typeRecycle '+ _typeRecycle);
    _listLeaderBoard = await _leaderBoardService.getListLeaderBoard(_typeRecycle, _typeDate);
    notifyListeners();
  }
}