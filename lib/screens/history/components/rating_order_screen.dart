import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/core/constants/color_constants.dart';
import 'package:shop_app/core/constants/size_constants.dart';
import 'package:shop_app/core/constants/strings_constant.dart';
import 'package:shop_app/models/history_response.dart';

class RatingOrderScreen extends StatefulWidget {
  static final String routeName = '/rate';

  const RatingOrderScreen({Key? key}) : super(key: key);

  @override
  _RatingOrderScreenState createState() => _RatingOrderScreenState();
}

class _RatingOrderScreenState extends State<RatingOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final Order item = Order.fromJson(
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);
    return Scaffold(
      appBar: AppBar(
        title: Text(kRate),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        children: [
            Container(
              padding: EdgeInsets.all(size8),
              height: 120,
              width: 120,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/user_empty.png"),
              ),
            ),
            Text(
                'Shipper',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: size18)),
            SizedBox(height: size8),
            Text(
                item.userShipper,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size12
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(size8),
                child: RatingBar.builder(
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (value) {
                    print('Rate: $value');
                  },
                ),
              ),
            ),
            Expanded(
              child: TextField(
                minLines: 6, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  fillColor: kBackgroundColor,
                  filled: true,
                  hintText: 'Hãy chia sẻ những điều bạn thắc mắc tại đây nhé.',
                  
                ),
              ),
            ),
           SizedBox(
             height: 40,
             width: double.infinity,
             child: DefaultButton(
               text: kConfirm,
               press: () {

               },
             ),
           )
        ],
      ),
          )),
    );
  }
}
