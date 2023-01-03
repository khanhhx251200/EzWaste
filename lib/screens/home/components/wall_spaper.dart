import 'package:flutter/material.dart';

class WallSpaper extends StatelessWidget {
  const WallSpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg'),
    );
  }
}
