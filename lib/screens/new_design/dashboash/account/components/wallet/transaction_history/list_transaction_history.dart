import 'package:flutter/material.dart';
import 'package:shop_app/screens/new_design/dashboash/account/components/wallet/transaction_history/item_transaction_history.dart';

class ListTransactionHistory extends StatelessWidget {
  const ListTransactionHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ItemTransactionHistory();
      },
    );
  }
}
