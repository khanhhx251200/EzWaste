import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/core/rest_api/api.dart';
import 'package:shop_app/helper/ToastUtils.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/models/my_error.model.dart';
import 'package:shop_app/screens/history/components/confirm_order.dart';
import 'package:shop_app/screens/history/components/confirm_order_success.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:shop_app/screens/sell/components/style_title.dart';
import 'package:shop_app/size_config.dart';

class DetailOrder extends StatefulWidget {
  static String routeName = "/detail-order";

  const DetailOrder({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  bool _isSeeMore = false;
  bool _isLoading = true;
  final Api _api = Api.apiProvider;

  Order? item;
  late int id;

  @override
  void initState() {
    id = widget.id;
    getDetailOrder(id);
    super.initState();
  }

  Future<void> getDetailOrder(id) async {
    try {
      final response =
          await _api.get(UrlConstant.GET_DETAIL_ORDER + '?id=$id');
      print(response);
      setState(() {
        _isLoading = false;
        if (response.statusCode == 200) {
          final dataResponse = response.data['data'];
          item = Order.fromJson(dataResponse);
        }
      });
    } on DioError catch (e) {
      throw e.error;
    } on Exception catch (_) {
      throw MyError(code: ErrorCode.unknown);
    }
  }

  Future<void> confirmOrder(id) async {
    try {
      final response =
          await _api.post(UrlConstant.CONFIRM_ORDER + '?id=$id');
      print(response);
      setState(() {
        if (response.statusCode == 200) {
          Navigator.pushNamed(context, ConfirmOrderSuccess.routeName);
        }
      });
    } on DioError catch (e) {
      throw e.error;
    } on Exception catch (_) {
      throw MyError(code: ErrorCode.unknown);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: item != null
            ? Text(
                item!.type == 1 ? 'Rác sinh hoạt' : 'Rác tái chế',
                style: TextStyle(
                    color: item!.type == 1 ? kOrganicColor : kPlasticColor,
                    fontWeight: FontWeight.bold),
              )
            : SizedBox(),
      ),
      body: SafeArea(
          child: Visibility(
        visible: !_isLoading,
        child: item != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(size8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          item!.status == 1 ? SizedBox() : infoCustomer(item!),
                          detailBill(item!),
                          Divider(color: kGreyColor, height: 2),
                          item!.status == 3 || item!.status == 4
                              ? buildTotalBill(item!)
                              : SizedBox(),
                          Divider(color: kGreyColor, height: 2),
                          addressOrder(),
                          Visibility(
                              visible: item!.status == 3,
                              child: SizedBox(
                                height: getProportionateScreenHeight(40),
                                width: double.infinity,
                                child: DefaultButton(
                                  press: ()  => Navigator.pushNamed(context, ConfirmOrder.routeName, arguments: item!),
                                  text: kConfirm + ' đơn hàng',
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            : SizedBox(),
      )),
    );
  }

  Padding addressOrder() {
    return Padding(
      padding: EdgeInsets.all(size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Địa điểm thu gom', style: styleTitle()),
          SizedBox(height: getProportionateScreenHeight(size20)),
          Text(
            item!.userCreateType,
            style: styleTitle(),
          ),
          Text(
            item!.address.isNotEmpty ? item!.address : kMyCompanyAddress,
            style: TextStyle(color: kFourLightColor, fontSize: size14),
          )
        ],
      ),
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
          title: Text(item.userShipperFullName,
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
                  color: item.status < 4 ? kWarningColor : kPrimaryColor,
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
            convertTimeStampToString(item.createDate),
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
                  convertTimeStampToString(item.time),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: item.status >= 3,
          child: ListTile(
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
              convertTimeStampToStringDetail(item.updateDate),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 12),
            ),
          ),
        ),
        item.listItem.isNotEmpty ? listItem(item) : SizedBox()
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
              subtitle: Text('${item.mass.toStringAsFixed(2)} kg',
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
              subtitle: Text('${item.money.toStringAsFixed(0)} VNĐ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ))
          ],
        ),
        Visibility(
            visible: item.status > 2 && item.type > 1,
            child: SizedBox(
              child: Column(
                children: [
                  Visibility(
                    visible: _isSeeMore,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: item.listItem.length,
                      itemBuilder: (context, index) {
                        final element = item.listItem[index];
                        return ListTile(
                          title: Text(element.idItemsModel.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor,
                                  fontSize: size12)),
                          subtitle: Text('${item.listItem[index].khoiluong} Kg',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size10)),
                          trailing: Text(
                              '${getItemMoney(item.listItem[index])}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor,
                                  fontSize: size12)),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: _isSeeMore,
                    child: Container(
                      margin: EdgeInsets.only(top: size20),
                      padding:
                          const EdgeInsets.symmetric(horizontal: size14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng (${item.mass.toStringAsFixed(2)} kg)',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size12,
                                  color: kBlackColor)),
                          Text('${item.money.toStringAsFixed(0)} VNĐ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size12,
                                  color: kBlackColor)),
                        ],
                      ),
                    ),
                  ),
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
                ],
              ),
            )),
      ],
    );
  }

  String getTotalMoneyInKL(double kg) {
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
