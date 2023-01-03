import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/screens/detail_order/detail_order_screen.dart';
import 'package:shop_app/screens/history/components/detail_complete.dart';
import 'package:shop_app/size_config.dart';

class ItemUnconfirmed extends StatefulWidget {
  const ItemUnconfirmed(
      {Key? key,
      required this.item,
      required this.onConfirm,
      required this.onFeedback})
      : super(key: key);
  final Order item;
  final VoidCallback onConfirm;
  final VoidCallback onFeedback;

  @override
  State<ItemUnconfirmed> createState() => _ItemUnconfirmedState();
}

class _ItemUnconfirmedState extends State<ItemUnconfirmed> {
  bool _isSeeMore = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailOrder(id: widget.item.id!)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: size8),
        child: Container(
          decoration: BoxDecoration(color: kWhiteColor),
          padding: const EdgeInsets.all(size8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.report_outlined, color: kWarningColor),
                  SizedBox(width: getProportionateScreenWidth(size8)),
                  Text('Chờ xác nhận',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kWarningColor,
                          fontSize: size12)),
                ],
              ),
              Divider(
                color: kGreyColor,
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('Mã đơn hàng',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: kFourLightColor,
                  //         fontSize: size12)),
                  // GestureDetector(
                  //   onTap: () {
                  //     Clipboard.setData(ClipboardData(text: "220109BVRJ4NYD"));
                  //     showToastInApp(
                  //         context, "Đã sao chép 220109BVRJ4NYD vào bộ nhớ tạm",
                  //         textColor: kWhiteColor, align: kBOTTOM);
                  //   },
                  //   child: RichText(
                  //       text: TextSpan(children: [
                  //     TextSpan(
                  //       text: '220109BVRJ4NYD'.toUpperCase(),
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: kFourLightColor,
                  //           fontSize: size12),
                  //     ),
                  //     TextSpan(
                  //       text: " " + kCopy.toUpperCase(),
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: kPrimaryColor,
                  //           fontSize: size12),
                  //     ),
                  //   ])),
                  // ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(size8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thời gian tạo đơn',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryTextColor,
                          fontSize: size12)),
                  Text(convertTimeStampToStringDetail(widget.item.createDate),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryTextColor,
                          fontSize: size12)),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(size8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thời gian yêu cầu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryTextColor,
                          fontSize: size12)),
                  Text(convertTimeStampToStringDetail(widget.item.time),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kSecondaryTextColor,
                          fontSize: size12)),
                ],
              ),
              Divider(color: kGreyColor),
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
                    subtitle: Text('${getTotalWeight(widget.item)} kg',
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
                    subtitle: Text(getTotalMoney(widget.item),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ))
                ],
              ),
              Visibility(
                  visible: _isSeeMore,
                  child: SizedBox(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.item.listItem.length,
                          itemBuilder: (context, index) {
                            final element = widget.item.listItem[index];
                            return ListTile(
                              title: Text(
                                  widget.item.listItem[index].idItemsModel
                                          .name +
                                      " (${widget.item.listItem[index].idItemsModel.money.toStringAsFixed(0)}đ)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kBlackColor,
                                      fontSize: size12)),
                              subtitle: Text(
                                  '${widget.item.listItem[index].khoiluong} kg',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size10)),
                              trailing: Text(
                                  '${getItemMoney(widget.item.listItem[index])}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kBlackColor,
                                      fontSize: size12)),
                            );
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: size14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tổng (${getTotalWeight(widget.item)} kg)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size12,
                                      color: kBlackColor)),
                              Text('${getTotalMoney(widget.item)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size12,
                                      color: kBlackColor)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Center(
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
              Divider(color: kGreyColor),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user_empty.png"),
                ),
                title: Text(widget.item.userShipperFullName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kFourLightColor,
                        fontSize: size14)),
                subtitle: Text(widget.item.userShipper,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                trailing: Text('Yêu cầu xác nhận',
                    style:
                        TextStyle(fontSize: size12, color: kWarningColor)),
              ),
              Divider(color: kGreyColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                        'Bạn đã thấy đúng thông tin đã bán chưa? Nếu đúng, chọn "Xác nhận" nha."',
                        style: TextStyle(
                            fontSize: size12, color: kNoSelectTextnColor)),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kErrorColor)),
                    onPressed: () => widget.onFeedback(),
                    child: Text(kFeedback),
                  ),
                  SizedBox(
                    width: size8,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor)),
                    onPressed: () => widget.onConfirm(),
                    child: Text(kConfirm),
                  ),
                ],
              )
            ],
          ),
        ),
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
    return money.toString() + " VNĐ";
  }

  String getItemMoney(ListItem item) {
    double money = 0;
    money = item.khoiluong * item.idItemsModel.money;
    return money > 1
        ? money.toString().split(".")[0] + " VNĐ"
        : money.toString() + " VNĐ";
  }
}
