import 'package:flutter/material.dart';

import '../../ui.dart';

class ProfileItem extends StatelessWidget {
  final String valueItem;
  final String titleItem;

  const ProfileItem({
    Key? key,
    required this.valueItem,
    required this.titleItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          valueItem,
          style: FontHelper.h8Bold(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          titleItem,
          style: FontHelper.h9Regular(
            color: Palette.greyLighten1,
          ),
        ),
      ],
    );
  }
}
