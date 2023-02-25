import 'package:flutter/material.dart';
import 'package:recycle_app/core/constants/color_constants.dart';
import 'package:recycle_app/core/constants/size_constants.dart';
import 'package:recycle_app/screens/new_design/dashboash/follow_booking/components/box_selection.dart';
import 'package:recycle_app/screens/new_design/dashboash/follow_booking/provider/booking_provider.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({Key? key, required this.selection}) : super(key: key);
  final BoxSelection selection;


  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {

  clickButton() {
    setState(() {
      widget.selection.isSelected = !widget.selection.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: size8),
      child: OutlinedButton(
        onPressed: () {
          clickButton();
        },
        child: Text(
          widget.selection.title,
          style: TextStyle(
              color: widget.selection.isSelected ? kWhiteColor : kGreyColor,
              fontSize: size12),
        ),
        style: styleButtonAction(isSelect: widget.selection.isSelected),
      ),
    );
  }

  ButtonStyle styleButtonAction({bool isSelect = false}) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            isSelect ? kGreenColor : kWhiteColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          side: BorderSide(color: isSelect ? kGreenColor : kGrey75Color),
          borderRadius: BorderRadius.circular(size20),
        )));
  }
}
