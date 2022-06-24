import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

// ignore: must_be_immutable
class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  UserHospital? userData;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments is UserHospital) {
      userData = ModalRoute.of(context)!.settings.arguments as UserHospital;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.hospitalInformation),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(
            26.0,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Wording.name,
                  style: FontHelper.h8Bold(),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  userData?.userData?.hospital?.name ?? "-",
                  style: FontHelper.h8Regular(),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Wording.classes,
                  style: FontHelper.h8Bold(),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  userData?.userData?.hospital?.hospitalClass ?? "-",
                  style: FontHelper.h8Regular(),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Wording.telephone,
                  style: FontHelper.h8Bold(),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  userData?.userData?.hospital?.phone ?? "-",
                  style: FontHelper.h8Regular(),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Wording.address,
                  style: FontHelper.h8Bold(),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  userData?.userData?.hospital?.address ?? "-",
                  style: FontHelper.h8Regular(),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
