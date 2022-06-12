import 'package:flutter/material.dart';

import '../../ui.dart';

class MenuItem extends StatelessWidget {
  final String textMenu;
  final IconData iconMenu;
  final VoidCallback? actionMenu;

  const MenuItem({
    Key? key,
    required this.textMenu,
    required this.iconMenu,
    this.actionMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => actionMenu != null ? actionMenu!.call() : null,
      child: SizedBox(
        width: 60.0,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(
                8.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Palette.greyLighten3,
                ),
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
              ),
              child: Icon(
                iconMenu,
                color: Palette.hospitalPrimary,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              textMenu,
              style: FontHelper.h9Regular(
                color: Palette.greyLighten1,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
