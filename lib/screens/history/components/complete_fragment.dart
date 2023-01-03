import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/models/my_error.model.dart';
import 'package:shop_app/screens/history/components/item_complete.dart';
import 'package:shop_app/screens/history/provider/history_provider.dart';

class CompleteFragment extends StatefulWidget {
  const CompleteFragment({Key? key}) : super(key: key);

  @override
  _CompleteFragmentState createState() => _CompleteFragmentState();
}

class _CompleteFragmentState extends State<CompleteFragment> {
  late Future<List<Order>> getList;
  @override
  void initState() {
    super.initState();
    getList = Provider.of<HistoryProvider>(context, listen: false).getListComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, provider, child) {
        return Container(
          color: kBackgroundColor,
          child:
           listHasData(provider),
        );
      },
    );
  }

  listNoData() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size20),
      child: Center(
        child: Text('Chưa có đơn nào'),
      ),
    );
  }

  listHasData(HistoryProvider provider) {
    return RefreshIndicator(
      onRefresh: () => provider.getListComplete(),
      child: FutureBuilder<List<Order>>(
        future: getList,
        builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text((snapshot.error as MyError).errorMessage),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final listOrders = provider.listComplete;

            return listOrders.length == 0
                ? Text('Không có lịch thu gom')
                : ListView.builder(
              shrinkWrap: true,
              itemCount: listOrders.length,
              itemBuilder: (context, index) {
                final element = provider.listComplete[index];
                return ItemComplete(item: element);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
