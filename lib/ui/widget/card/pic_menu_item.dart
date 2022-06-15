import 'package:flutter/material.dart';

import '../../ui.dart';

class PicMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? action;

  const PicMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action != null ? action!.call() : null,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Palette.hospitalPrimary,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Palette.white,
              size: 24.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: FontHelper.h7Bold(
                color: Palette.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
