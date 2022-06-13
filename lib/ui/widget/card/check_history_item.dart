import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class CheckHistoryItem extends StatelessWidget {
  final String? polyValue;
  final String? dateTimeValue;
  final String? doctorName;
  final VoidCallback? action;

  const CheckHistoryItem({
    Key? key,
    this.polyValue,
    this.dateTimeValue,
    this.doctorName,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      width: 60.0,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(
              5.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.greyLighten3,
              ),
              borderRadius: BorderRadius.circular(
                6.0,
              ),
            ),
            child: const Icon(
              Icons.list_alt_outlined,
              color: Palette.black,
              size: 18.0,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${polyValue ?? '-'} -\t ${dateTimeValue ?? '-'}",
                  style: FontHelper.h9Regular(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  doctorName ?? '-',
                  style: FontHelper.h9Bold(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SquareButton(
              buttonText: Wording.seeDetail,
              onTap: () => action != null ? action!.call() : null,
            ),
          ),
        ],
      ),
    );
  }
}
