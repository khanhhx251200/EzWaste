import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/electronic_scale.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/screens/sell/components/style_title.dart';
import 'package:shop_app/size_config.dart';
import 'package:http/http.dart' as http;

class DetailComplete extends StatefulWidget {
  static String routeName = "/detail-complete";

  const DetailComplete({Key? key}) : super(key: key);

  @override
  _DetailCompleteState createState() => _DetailCompleteState();
}

class _DetailCompleteState extends State<DetailComplete> {
  bool _isSeeMore = false;
  ElectronicScale? electronicScale;

  getKL() async {
    try {
      final http.Response response =
          await http.get(Uri.parse("http://45.117.80.11:1884/get=12345"));
      final parsed = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        electronicScale = ElectronicScale.fromJson(parsed);
        print('value: ${parsed.toString()}');
      });

      Future.delayed(Duration(milliseconds: 500), () {
        getKL();
      });
    } catch (e) {}
  }

  double convertKL(double klg) {
    return klg * 0.001;
  }

  @override
  void initState() {
    super.initState();
    getKL();
  }

  @override
  Widget build(BuildContext context) {
    final Order item = Order.fromJson(
        ModalRoute
            .of(context)!
            .settings
            .arguments as Map<String, dynamic>);
    print(item);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(size8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item.status == 1 ? SizedBox() : infoCustomer(item),
                  detailBill(item),
                  Divider(color: kGreyColor, height: 2),
                  item.status == 3 || item.status == 4
                      ? buildTotalBill(item)
                      : SizedBox(),
                  Divider(color: kGreyColor, height: 2),
                  Padding(
                    padding: EdgeInsets.all(size20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Địa điểm thu gom', style: styleTitle()),
                        SizedBox(
                            height: getProportionateScreenHeight(size20)),
                        Text(
                          item.address.isNotEmpty ? 'Nhà riêng' : "Kho",
                          style: styleTitle(),
                        ),
                        Text(
                          item.address.isNotEmpty
                              ? item.address
                              : 'Hẻm 702 Điện Biên Phủ, Quận 10, Thành phố Hồ Chí Minh, Việt Nam',
                          style: TextStyle(
                              color: kFourLightColor, fontSize: size14),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Padding buildTotalBill(Order item) {
    return Padding(
      padding: const EdgeInsets.all(size20),
      child: Row(
        children: [
          Text(
            'Thành tiền',
            style: styleTitle(),
          ),
          Spacer(),
          Text(
            '${getTotalMoney(item)}',
            style: styleTitle(),
          ),
        ],
      ),
    );
  }

  infoCustomer(Order item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: size20),
          child: Text(
            'Thông tin người thu mua',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kFourLightColor,
                fontSize: size16),
          ),
        ),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: size20),
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_empty.png"),
          ),
          title: Text('Nhân viên ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kFourLightColor,
                  fontSize: size14)),
          subtitle: Text(item.userShipper,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          trailing: Text(getStatus(item.status),
              style: TextStyle(
                  fontSize: size12,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  String getStatus(int status) {
    if (status == 1) {
      return "Chờ tiếp nhận";
    } else if (status == 2) {
      return "Đã tiếp nhận";
    } else if (status == 3) {
      return "Chờ xác nhận";
    } else if (status == 4) {
      return "Hoàn thành";
    }
    return "";
  }

  detailBill(Order item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: size20),
          child: Text(
            'Chi tiết đơn hàng',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kFourLightColor,
                fontSize: size16),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.date_range,
            color: kPrimaryColor,
          ),
          title: Text(
            'Thời gian tạo đơn',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kFourLightColor,
                fontSize: 12),
          ),
          trailing: Text(
            'Chưa có time tạo đơn',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 12),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.date_range,
            color: kPrimaryColor,
          ),
          title: Text(
            'Thời gian yêu cầu thu gom',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kFourLightColor,
                fontSize: 12),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  convertDateToNameOfDay(convertStringToDateTime(
                      convertTimeStampToString(item.time))),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 12),
                ),
              ),
              Flexible(
                child: Text(
                  convertTimeStampToStringDetail(item.time),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.date_range,
            color: kPrimaryColor,
          ),
          title: Text(
            'Thời gian thu gom',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kFourLightColor,
                fontSize: 12),
          ),
          trailing: Text(
            convertTimeStampToStringDetail(item.time),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 12),
          ),
        ),
        !item.listItem.isNotEmpty ? listItem(item) : SizedBox()
      ],
    );
  }

  listItem(Order item) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
              subtitle: Text(
                  '${convertKL(electronicScale != null ? electronicScale!.value : 0).toStringAsFixed(3)} kg',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            )),
            Expanded(
                child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
              subtitle: Text('${getTotalMoneyInKL(convertKL(electronicScale != null ? electronicScale!.value : 0))}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ))
          ],
        ),
        // Visibility(
        //     visible: _isSeeMore,
        //     child: SizedBox(
        //       child: Column(
        //         children: [
        //           ListView.builder(
        //             physics: NeverScrollableScrollPhysics(),
        //             shrinkWrap: true,
        //             itemCount: item.listItem.length,
        //             itemBuilder: (context, index) {
        //               final element = item.listItem[index];
        //               return ListTile(
        //                 leading: Image.asset(
        //                   element.idItemsModel.url,
        //                   height: 40,
        //                   width: 40,
        //                 ),
        //                 title: Text(element.idItemsModel.name,
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         color: kBlackColor,
        //                         fontSize: size12)),
        //                 subtitle: Text('${item.listItem[index].khoiluong} Kg',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: size10)),
        //                 trailing: Text('${getItemMoney(item.listItem[index])}',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         color: kBlackColor,
        //                         fontSize: size12)),
        //               );
        //             },
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(top: size20),
        //             padding: const EdgeInsets.symmetric(horizontal: size14),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text('Tổng (${getTotalWeight(item)} kg)',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: size12,
        //                         color: kBlackColor)),
        //                 Text('${getTotalMoney(item)}',
        //                     style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: size12,
        //                         color: kBlackColor)),
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //     )),
        Center(
            child: TextButton(
          onPressed: () {
            setState(() {
              _isSeeMore = !_isSeeMore;
            });
          },
          child: Text(!_isSeeMore ? kSeeMore : kCollapse,
              style:
                  TextStyle(fontSize: size12, color: kNoSelectTextnColor)),
        )),
      ],
    );
  }

  String getTotalMoneyInKL(double kg){
    double total = kg * 3000;
    String result = total.toStringAsFixed(2);
    return result + ' VNĐ';
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
    return money.toString().split(".")[0] + " VNĐ";
  }
}
