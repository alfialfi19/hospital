import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'Rumah Sakit Semen Gresik',
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
                  'C',
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
                  '031-3945522',
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
                  'Jl. Mawar Melati No. 66, Kabupaten Gresik',
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
