import 'package:flutter/material.dart';

import '../../ui.dart';

class NotificationItem extends StatelessWidget {
  final String? queueNumber;
  final String? date;
  final String? message;

  const NotificationItem({
    Key? key,
    this.queueNumber,
    this.date,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Palette.greyLighten3,
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "No. Antrian ${queueNumber ?? '-'}",
                style: FontHelper.h7Regular(),
              ),
              Text(
                date ?? "-",
                style: FontHelper.h9Regular(),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message ?? "-",
                  style: FontHelper.h8Bold(),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Palette.hospitalPrimary,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                padding: const EdgeInsets.all(
                  5.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
