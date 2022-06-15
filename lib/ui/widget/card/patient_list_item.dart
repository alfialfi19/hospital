import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class PatientListItem extends StatelessWidget {
  final String? profilePic;
  final String? patientName;
  final String? queueNumber;
  final VoidCallback? action;

  const PatientListItem({
    Key? key,
    this.profilePic,
    this.patientName,
    this.queueNumber,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action != null ? action!.call() : null,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.0,
              width: 60.0,
              child: Image.asset(
                profilePic ?? Images.manProfile,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              height: 60.0,
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patientName ?? "-",
                    style: FontHelper.h8Bold(),
                  ),
                  Text(
                    queueNumber ?? "-",
                    style: FontHelper.h8Regular(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
