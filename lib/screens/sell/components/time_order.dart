

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/screens/sell/components/item_time.dart';
import 'package:shop_app/screens/sell/components/style_title.dart';
import 'package:shop_app/size_config.dart';

import '../sell_provider.dart';
import 'item_date.dart';
class DateOrder extends StatefulWidget {
  const DateOrder({Key? key, required this.provider}) : super(key: key);
  final SellProvider provider;

  @override
  _DateOrderState createState() => _DateOrderState();
}

class _DateOrderState extends State<DateOrder> {
  bool typeTime = false;

  @override
  void initState() {
    super.initState();
    widget.provider.getNext15Days();
    // widget.provider.setTypeTime(DateTime.now().weekday %2 == 0 ? typeTime : !typeTime);
    widget.provider.setTypeTime(typeTime);
    typeTime = widget.provider.typeOrder;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.timer, color: kPrimaryColor, size: 32),
              Expanded(child: Text('Thời gian thu gom', style: styleTitle())),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: size8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: kGreyColor.shade300,
                borderRadius: BorderRadius.all(Radius.circular(size8))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(size8)),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Thời gian dự kiến: ',
                        style:
                        TextStyle(color: kFourLightColor, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: getIntendTime(widget.provider),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: getProportionateScreenHeight(size8)),
                    buildChooseDate(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String getIntendTime(SellProvider provider){
    String intendTime = '';
    if(provider.dateSellSelected != null && provider.dateSellSelected!.isSelected){
      intendTime = DateFormat.yMMMMd('vi_VN').format(provider.dateSellSelected!.dateTime!);
    }
    return intendTime;
  }

  SingleChildScrollView buildChooseDate() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            widget.provider.listDate.length,
            (index) {
              final element = widget.provider.listDate[index];
              bool _isDisable = false;
              if (!typeTime){ // Rác tác chế
                if (element.dateTime!.weekday %2 == 0 ) {
                  _isDisable = true;
                } else {
                  _isDisable = false;
                }
              } else {
                if (element.dateTime!.weekday %2 != 0 ) {
                  _isDisable = true;
                } else {
                  _isDisable = false;
                }
              }
              return GestureDetector(
                onTap: () => !_isDisable ? widget.provider.setSelectedDate(index) : null,
                child: ItemDate(
                  dateOrder: element,
                  isDisable: _isDisable,
                ),
              ); // here by default width and height is 0
            },
          ),
          SizedBox(width: getProportionateScreenWidth(size8)),
        ],
      ),
    );
  }

  GridView buildChooseTime() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 3,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 6.0,
        ),
        itemCount: widget.provider.listTime.length,
        itemBuilder: (BuildContext ctx, index) {
          final element = widget.provider.listTime[index];
          bool isCurrentDate =
              convertDateToString(widget.provider.dateSellSelected!.dateTime) ==
                  convertDateToString(DateTime.now());
          bool disableTimePassed = isCurrentDate
              ? DateTime.now().hour >= int.parse(element.time!.split(":")[0])
              : false;
          element.isDisable = disableTimePassed;
          return GestureDetector(
            onTap: disableTimePassed
                ? null
                : () => widget.provider.setSelectedTime(index),
            child: ItemTime(
              timeSell: element,
              provider: widget.provider,
            ),
          );
        });
  }

  btnChooseTime(String text, bool type) {
    return Expanded(
      child: MaterialButton(
        color: type ? kPrimaryColor : kWhiteColor,
        onPressed: () {
          setState(() {
            typeTime = !typeTime;
          });
          print(typeTime);
          widget.provider.setTypeTime(typeTime);
          print(widget.provider.typeOrder);
          widget.provider.setSelectedDate(-1);
        },
        child: Text(text,
            style: TextStyle(color: !type ? kPrimaryColor : kWhiteColor)),
      ),
    );
  }
}
