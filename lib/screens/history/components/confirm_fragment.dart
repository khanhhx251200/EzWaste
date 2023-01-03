import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/history/components/confirm_order.dart';
import 'package:shop_app/screens/history/components/item_unconfimred.dart';
import 'package:shop_app/screens/history/components/refuse_fragment.dart';
import 'package:shop_app/screens/history/provider/history_provider.dart';

class ConfirmFragment extends StatefulWidget {
  const ConfirmFragment({Key? key}) : super(key: key);

  @override
  _ConfirmFragmentState createState() => _ConfirmFragmentState();
}

class _ConfirmFragmentState extends State<ConfirmFragment> {
  @override
  void initState() {
    super.initState();
    Provider.of<HistoryProvider>(context, listen: false).getListConfirmed();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, provider, child) {
        return Container(
            color: kBackgroundColor,
            child: provider.listConfirm.length > 0
                ? listHasData(provider)
                : listNoData());
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
      onRefresh: () => provider.getListConfirmed(),
      child: ListView.builder(
        itemCount: provider.listConfirm.length,
        itemBuilder: (context, index) {
          final element = provider.listConfirm[index];
          return ItemUnconfirmed(
              item: element,
              onConfirm: () => Navigator.pushNamed(context, ConfirmOrder.routeName, arguments: element),
              onFeedback: () => Navigator.pushNamed(context, RefuseBookingScreen.routeName));
        },
      ),
    );
  }
}
