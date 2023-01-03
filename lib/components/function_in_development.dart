import 'package:flutter/material.dart';
import 'package:shop_app/core/constants/size_constants.dart';

class FunctionInDevelopment extends StatelessWidget {
  const FunctionInDevelopment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background_booking.png'), fit: BoxFit.cover)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size14, vertical: _size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(size14),
                child: Text(
                  'EZ Waste xin lỗi',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size18),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(size14),
                child: Text(
                  'Chức năng đang trong giai đoạn phát triển',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
