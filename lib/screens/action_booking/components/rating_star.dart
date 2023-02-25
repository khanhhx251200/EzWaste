import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';

class RatingStar extends StatefulWidget {
  const RatingStar(
      {Key? key, this.numberRating = 0, required this.notifyParent})
      : super(key: key);
  final double numberRating;

  final ValueChanged<double> notifyParent;

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  void manageState(value) {
    widget.notifyParent(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size32),
      child: RatingBar.builder(
        initialRating: widget.numberRating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: size12),
        unratedColor: kPrimaryColor.withOpacity(0.2),
        itemBuilder: (context, _) => Icon(
          FontAwesomeIcons.solidStar,
          color: kPrimaryColor,
        ),
        onRatingUpdate: (rating) {
          manageState(rating);
        },
      ),
    );
  }
}
