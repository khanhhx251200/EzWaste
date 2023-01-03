import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/history_response.dart';
import 'package:shop_app/size_config.dart';

class ItemRequestAccept extends StatelessWidget {
  const ItemRequestAccept({Key? key, required this.item}) : super(key: key);
  final Order item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: size8),
      child: Container(
        decoration: BoxDecoration(color: kWhiteColor),
        padding: const EdgeInsets.all(size8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Đã tiếp nhận yêu cầu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kWarningColor,
                        fontSize: size12)),
              ],
            ),
            Divider(color: kGreyColor),
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
                Text(convertTimeStampToString(item.createDate),
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
                Text(convertTimeStampToStringDetail(item.time),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kSecondaryTextColor,
                        fontSize: size12)),
              ],
            ),
            Divider(color: kGreyColor),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              title: Text(item.userShipperFullName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kFourLightColor,
                      fontSize: size14)),
              subtitle: Text(item.userShipper,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              trailing: Text('Đã xác nhận',
                  style: TextStyle(
                      fontSize: size12, color: kPrimaryColor)),
            )
          ],
        ),
      ),
    );
  }
}
