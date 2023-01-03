import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/models/my_error.model.dart';
import 'package:shop_app/screens/history/components/item_request.dart';
import 'package:shop_app/screens/history/components/item_request_accept.dart';
import 'package:shop_app/screens/history/provider/history_provider.dart';

class RequestFragment extends StatefulWidget {
  const RequestFragment({Key? key}) : super(key: key);

  @override
  _RequestFragmentState createState() => _RequestFragmentState();
}

class _RequestFragmentState extends State<RequestFragment> {
  late Future<List<Order>> getList;

  @override
  void initState() {
    super.initState();
    getList = context.read<HistoryProvider>().getListRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, provider, child) {
        return Container(
          color: kBackgroundColor,
          child:
              provider.listRequest.isEmpty ? listNoData() : listHasData(provider),
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
      onRefresh: () => provider.getListRequest(),
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
            final listOrders = provider.listRequest;

            return listOrders.length == 0
                ? Text('Không có lịch thu gom')
                : ListView.builder(
              shrinkWrap: true,
              itemCount: listOrders.length,
              itemBuilder: (context, index) {
                final element = provider.listRequest[index];
                return itemList(element, provider);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  itemList(Order element, HistoryProvider provider) {
     if (element.status == 2) {
      return ItemRequestAccept(item: element);
    } else if (element.status == 1) {
      return ItemRequest(item: element);
    }
  }
}
