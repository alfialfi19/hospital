import 'package:flutter/material.dart';

import '../../ui.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final Color? buttonColor;

  const PrimaryButton({
    Key? key,
    required this.buttonText,
    this.textStyle,
    required this.onTap,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap != null ? onTap!.call() : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: buttonColor ?? Palette.hospitalPrimary,
        ),
        child: Text(
          buttonText,
          style: textStyle ??
              FontHelper.h7Regular(
                color: Palette.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
