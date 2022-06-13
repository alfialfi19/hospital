import 'package:flutter/material.dart';

import '../../ui.dart';

class SquareButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final Color? buttonColor;

  const SquareButton({
    Key? key,
    required this.buttonText,
    this.textStyle,
    this.onTap,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap != null ? onTap!.call() : null,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 5.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: buttonColor ?? Palette.hospitalPrimary,
        ),
        child: Text(
          buttonText,
          style: textStyle ??
              FontHelper.h9Regular(
                color: Palette.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
