import 'package:bmicalculator/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,

    //required this.buttonWidth,
    //required this.buttonHeight,
  });

  //final double buttonWidth;
  //final double buttonHeight;

  // ignore: non_constant_identifier_names
  final String buttonTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: kBottomContainerColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
