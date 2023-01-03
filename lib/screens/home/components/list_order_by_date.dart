import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/models/my_error.model.dart';
import 'package:shop_app/screens/detail_order/detail_order_screen.dart';
import 'package:shop_app/screens/home/provider/home_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ListOrderByDate extends StatefulWidget {
  const ListOrderByDate({
    Key? key,
    required this.color,
    required this.provider,
  }) : super(key: key);

  final dynamic color;
  final HomeProvider provider;

  @override
  State<ListOrderByDate> createState() => _ListOrderByDateState();
}

class _ListOrderByDateState extends State<ListOrderByDate> {
  late Future<List<Order>> getListOrder;

  @override
  void initState() {
    getListOrder = widget.provider.getListOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return FutureBuilder<List<Order>>(
      future: getListOrder,
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
          final listOrders = widget.provider.listOrder;

          return listOrders.length == 0 && !widget.provider.isLoadingListOrder
              ? Center(child: Text('Không có lịch thu gom'))
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listOrders.length,
                  itemBuilder: (context, index) {
                    final element = listOrders[index];
                    return GestureDetector(
                      onTap: element.id == -1
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailOrder(id: element.id!)),
                              );
                            },
                      child: Container(
                        height: _size.height * 0.2,
                        width: _size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal: size8,
                            vertical: size8),
                        decoration: boxDecorationShadow(),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: size8),
                                    width: 6,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: widget.color,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        )),
                                  ),
                                  Expanded(
                                      child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: size8),
                                      child: Text(
                                          widget.color == kOrganicColor
                                              ? 'Rác sinh hoạt'
                                              : 'Rác tái chế',
                                          style: TextStyle(
                                              color: widget.color,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    subtitle: Text(
                                        'Địa chỉ: ${element.address}',
                                        style: TextStyle(fontSize: size12)),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: size8),
                              child: Divider(
                                height: 2,
                                color: widget.color,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: size8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      information(Icons.person,
                                          element.userShipperFullName, false),
                                      information(Icons.phone,
                                          element.userShipper, true),
                                    ],
                                  )),
                                  iconStatus(element.status)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Padding information(IconData icon, String text, isSubTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: size18),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: isSubTitle ? () => _makingPhoneCall(text) : null,
              padding: EdgeInsets.symmetric(vertical: size8 - 2),
              constraints: BoxConstraints(),
              icon: Icon(icon, color: kGreyColor, size: size20)),
          SizedBox(width: size8),
          Text(
            text,
            style: isSubTitle ? null : TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget iconStatus(status) {
    if (status == 2) {
      return Icon(Icons.timelapse_outlined, color: kWarningColor);
    } else if (status == 3) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(width: 4),
          Text('Chờ xác nhận',
              style: TextStyle(color: kWarningColor, fontSize: size12)),
          Icon(Icons.error, color: kWarningColor),
        ],
      );
    } else if (status == 4) {
      return SvgPicture.asset('assets/icons/Success.svg',
          color: kSuccessColor, height: 12, width: 12);
    } else {
      return SizedBox();
    }
  }

  _makingPhoneCall(numberPhone) async {
    var url = Uri.parse("tel:$numberPhone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
