import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/history_response.dart';

class ProductInOrder extends StatefulWidget {
  const ProductInOrder({Key? key,required this.order}) : super(key: key);
  final Order order;

  @override
  State<ProductInOrder> createState() => _ProductInOrderState();
}

class _ProductInOrderState extends State<ProductInOrder> {
  bool _isSeeMore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: ListTile(
                    dense: true,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    leading: Image.asset(
                      "assets/images/weight.png",
                      width: 32,
                      height: 32,
                    ),
                    title: Text('Khối lượng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kFourLightColor,
                            fontSize: size12)),
                    subtitle: Text('${getTotalWeight(widget.order)} kg',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              Expanded(
                  child: ListTile(
                    dense: true,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    leading: Image.asset(
                      "assets/images/total_money.png",
                      width: 32,
                      height: 32,
                    ),
                    title: Text('Thành tiền',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kFourLightColor,
                            fontSize: size12)),
                    subtitle: Text('${getTotalMoney(widget.order)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ))
            ],
          ),
          Visibility(
              visible: _isSeeMore && widget.order.type == 2,
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phân loại",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                                fontSize: size16)),
                        Text("Đơn giá",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                                fontSize: size16)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: size8),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.order.listItem.length,
                      itemBuilder: (context, index) {
                        final element = widget.order.listItem[index];
                        return ListTile(
                          title: Text(
                              element.idItemsModel.name +
                                  " (${element.idItemsModel.money.toStringAsFixed(0)}đ)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor,
                                  fontSize: size12)),
                          subtitle: Text(
                              '${widget.order.listItem[index].khoiluong} Kg',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size10)),
                          trailing: Text(
                              '${getItemMoney(widget.order.listItem[index])}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor,
                                  fontSize: size12)),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: size8),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: size14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng (${getTotalWeight(widget.order)} kg)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size16,
                                  color: kBlackColor)),
                          Text('${getTotalMoney(widget.order)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size16,
                                  color: kBlackColor)),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          if(widget.order.type == 2) Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isSeeMore = !_isSeeMore;
                  });
                },
                child: Text(!_isSeeMore ? kSeeMore : kCollapse,
                    style: TextStyle(
                        fontSize: size12, color: kNoSelectTextnColor)),
              )),
        ],
      ),
    );
  }

  String getTotalWeight(Order item) {
    double weight = 0;
    for (int i = 0; i < item.listItem.length; i++) {
      weight += item.listItem[i].khoiluong;
    }
    return weight.toStringAsFixed(1);
  }

  String getTotalMoney(Order item) {
    double money = 0;
    for (int i = 0; i < item.listItem.length; i++) {
      money += item.listItem[i].idItemsModel.money * item.listItem[i].khoiluong;
    }
    return money.toString().split(".")[0] + " VNĐ";
  }

  String getItemMoney(ListItem item) {
    double money = 0;
    money = item.khoiluong * item.idItemsModel.money;
    return money > 1
        ? money.toString().split(".")[0] + " VNĐ"
        : money.toString() + " VNĐ";
  }
}
