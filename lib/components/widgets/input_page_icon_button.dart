import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xff4C4F5E),
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      child: Icon(icon),
    );
  }
}
