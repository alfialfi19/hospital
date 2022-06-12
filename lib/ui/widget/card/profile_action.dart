import 'package:flutter/material.dart';

import '../../ui.dart';

class ProfileAction extends StatelessWidget {
  final IconData iconAction;
  final String titleAction;
  final VoidCallback? action;

  const ProfileAction({
    Key? key,
    required this.iconAction,
    required this.titleAction,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action != null ? action!.call() : null,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(
              8.0,
            ),
            decoration: BoxDecoration(
              color: Palette.hospitalBackground,
              borderRadius: BorderRadius.circular(
                6.0,
              ),
            ),
            child: Icon(
              iconAction,
              size: 16.0,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          SizedBox(
            width: 60.0,
            child: Text(
              titleAction,
              style: FontHelper.h9Regular(),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: 210.0,
            child: const Icon(
              Icons.chevron_right_rounded,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
