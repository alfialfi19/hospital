import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class DoctorListItem extends StatelessWidget {
  final String? profilePic;
  final String? doctorName;
  final String? doctorPoly;
  final String? scheduleDesc;
  final String? quotaAllow;
  final VoidCallback? action;

  const DoctorListItem({
    Key? key,
    this.profilePic,
    this.doctorName,
    this.doctorPoly,
    this.scheduleDesc,
    this.quotaAllow,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName ?? "-",
                    style: FontHelper.h8Bold(),
                  ),
                  Text(
                    doctorPoly ?? "-",
                    style: FontHelper.h8Regular(),
                  ),
                  Text(
                    scheduleDesc ?? "-",
                    style: FontHelper.h9Regular(),
                  ),
                ],
              ),
            ),
            if (quotaAllow != null) ...[
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "${Wording.quotaAllow}${quotaAllow ?? '0'}",
                      style: FontHelper.h9Bold(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              )
            ] else ...[
              Container(),
            ],
          ],
        ),
      ),
    );
  }
}
