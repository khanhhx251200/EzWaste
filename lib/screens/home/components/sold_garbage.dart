import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/screens/home/components/type_garbage.dart';

class SoldGarbage extends StatelessWidget {
  const SoldGarbage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(size8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Số lượng đã tái chế',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size18),
              ),
              Divider(thickness: 1),
              Row(
                children: [
                  Expanded(
                      child: TypeGarbage(type: 1)),
                  Expanded(
                      child: TypeGarbage(type: 2)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

