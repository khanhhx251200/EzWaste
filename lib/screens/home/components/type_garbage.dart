import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/endpoint_constant.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/rest_api/api.dart';

class TypeGarbage extends StatefulWidget {
  const TypeGarbage({
    Key? key,
    required this.type,
  }) : super(key: key);
  final int type;

  @override
  State<TypeGarbage> createState() => _TypeGarbageState();
}

class _TypeGarbageState extends State<TypeGarbage> {
  final Api _api = Api.apiProvider;

  String mass = '';
  String money = '';

  @override
  initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      final response = await _api
          .get(UrlConstant.GET_DATA_BY_TYPE + '?type=${widget.type}');
      if (response.statusCode == 200) {
        final dataResponse = response.data['data'];
        setState(() {
          mass = (dataResponse['mass'] as double).toStringAsFixed(2);
          money = (dataResponse['money'] as double).toStringAsFixed(0);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Image.asset(
          widget.type == 1
              ? 'assets/icons/organic.png'
              : 'assets/icons/plastic.png',
          width: 24,
          height: 60,
        )),
        SizedBox(width: 4),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.type == 1 ? 'Rác sinh hoạt': 'Rác tái chế',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.type == 1 ? kOrganicColor : kPlasticColor),
                ),
                SizedBox(height: 4),
                Text.rich(TextSpan(
                    text: 'Đã bán: ',
                    style: TextStyle(fontSize: size12),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '$mass kg',
                        style: TextStyle(
                            fontSize: size12,
                            fontWeight: FontWeight.bold,
                            color: widget.type == 1
                                ? kOrganicColor
                                : kPlasticColor),
                      )
                    ])),
                SizedBox(height: 4),
                Text.rich(TextSpan(
                    text: 'Thành tiền: ',
                    style: TextStyle(fontSize: size12),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '$money đ',
                        style: TextStyle(
                            fontSize: size12,
                            fontWeight: FontWeight.bold,
                            color: widget.type == 1
                                ? kOrganicColor
                                : kPlasticColor),
                      )
                    ])),
              ],
            ))
      ],
    );
  }
}
