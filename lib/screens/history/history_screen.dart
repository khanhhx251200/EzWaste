import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/history/components/complete_fragment.dart';
import 'package:shop_app/screens/history/components/confirm_fragment.dart';
import 'package:shop_app/screens/history/components/request_fragment.dart';

class HistoryScreen extends StatefulWidget {
  static String routeName = "/history";

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  nextToSearch(){

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          leading: BackButton(
            color: kPrimaryColor,
          ),
          title: Text("Đơn hàng", style: TextStyle(color: kBlackColor),),
          // actions: [
          //   IconButton(onPressed: () => nextToSearch, icon: Icon(Icons.search, color: kPrimaryColor,))
          // ],
          bottom: TabBar(
            unselectedLabelColor: kNoSelectTextnColor,
            labelColor: kPrimaryColor,
            indicatorColor: kPrimaryColor,
            labelStyle: TextStyle(fontSize: size12),
            tabs: [
              Tab(text: 'Yêu cầu thu gom'),
              Tab(text: 'Xác nhận thu gom'),
              Tab(text: 'Hoàn thành'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: RequestFragment()),
            Center(child: ConfirmFragment()),
            Center(child: CompleteFragment())
          ],
        ),
      ),
    );
  }
}
