import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/decoration_border_shadow.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/info_customer.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/booking.dart';
import 'package:shop_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:shop_app/screens/new_design/detail_booking/detail_booking_screen.dart';

class ItemTracking extends StatelessWidget {
  const ItemTracking({
    Key? key,
    required this.booking,
  }) : super(key: key);
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<BookingProvider>(context, listen: false)
            .getDetail(booking.id!);
        Navigator.pushNamed(context, DetailBookingScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: size8, horizontal: size16),
        decoration: boxDecorationShadow(radius: size20),
        padding: const EdgeInsets.all(size14),
        child: Column(
          children: [
            InfoShipper(booking: booking),
            const SizedBox(
              height: size8,
            ),
            buildBody(),
            const SizedBox(
              height: size8,
            ),
            buildFooter(context, booking.type!)
          ],
        ),
      ),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: itemBody(Icons.date_range,
                  convertTimeStampToString(booking.dateBooking!),
                  colorIcon:
                      valueByType(booking.type, kOrganicColor, kPlasticColor)),
            ),
            Expanded(
              child: itemBody(Icons.delete_outline,
                  valueByType(booking.type, kOrganicRecycle, kPlasticRecycle),
                  colorIcon:
                      valueByType(booking.type, kOrganicColor, kPlasticColor)),
            ),
          ],
        ),
        booking.status! >= 3
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: itemBody(
                        const IconData(0xf24e, fontFamily: 'MaterialIcons'),
                        booking.money.toString() + ' VNĐ',
                        colorIcon: valueByType(
                            booking.type, kOrganicColor, kPlasticColor)),
                  ),
                  Expanded(
                    child: itemBody(
                        const IconData(0xe235, fontFamily: 'MaterialIcons'),
                        booking.mass.toString() + ' kg',
                        colorIcon: valueByType(
                            booking.type, kOrganicColor, kPlasticColor)),
                  ),
                ],
              )
            : const SizedBox(),
        itemBody(Icons.location_on, booking.address!,
            colorIcon: valueByType(booking.type, kOrganicColor, kPlasticColor)),
        booking.noteSeller != null && booking.noteSeller != ''
            ? itemBody(Icons.event_note, booking.noteSeller!.trim(),
                colorIcon:
                    valueByType(booking.type, kOrganicColor, kPlasticColor))
            : SizedBox(),
        const Divider(),
        itemBody(statusIcon(booking.status!), statusString(booking.status!),
            colorIcon: statusColor(booking.status!)),
      ],
    );
  }

  Padding itemBody(IconData icon, String data, {colorIcon = kGreenColor}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: size8, horizontal: size8 / 2),
      child: Row(
        children: [
          Icon(
            icon,
            color: colorIcon,
            size: size18,
          ),
          const SizedBox(
            width: size12,
          ),
          Expanded(
            child: Text(
              data.trim(),
              style: const TextStyle(
                  fontSize: size12,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor),
            ),
          )
        ],
      ),
    );
  }

  Row buildFooter(BuildContext context, int type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Expanded(
        //     child: type != 4 && type != 5
        //         ? DefaultButton(
        //             press: () {
        //               if (booking.type == 2) {
        //                 // Navigator.pushNamed(
        //                 //     context, CreateConfirmPlastic.routeName,
        //                 //     arguments: order);
        //               }
        //             },
        //             color: kGreenColor,
        //             text: 'Thu gom',
        //             textSize: size12,
        //           )
        //         : const SizedBox()),
        // SizedBox(
        //   width: size8 / 2,
        // ),
        Expanded(
            child: type >= 3
                ? DefaultButton(
                    press: () {},
                    text: kDetail,
                    textSize: size12,
                    color: kBlueColor,
                  )
                : const SizedBox())
      ],
    );
  }
}
