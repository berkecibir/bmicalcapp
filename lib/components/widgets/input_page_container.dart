import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputPageCard extends StatelessWidget {
  InputPageCard({
    super.key,
    required this.cardColor,
    this.cardChild,
    this.onPress,
  });
  final Color cardColor;
  Widget? cardChild;
  void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,   
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
