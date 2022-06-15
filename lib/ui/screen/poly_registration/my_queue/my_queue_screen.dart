import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../../ui.dart';

class MyQueueScreen extends StatelessWidget {
  const MyQueueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.myQueue),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(
                26.0,
              ),
              children: [
                _buildDateTimeSection(context),
                const SizedBox(
                  height: 20.0,
                ),
                _buildPolyAndDoctorSection(context),
                const SizedBox(
                  height: 20.0,
                ),
                _buildMedicalNumberSection(context),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Palette.hospitalPrimary,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          Wording.yourQueue,
                          style: FontHelper.h7Bold(
                            color: Palette.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "10",
                          style: FontHelper.h3Bold(
                            color: Palette.white,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 70.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: _buildGreetingsSection(context),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: SquareButton(
                  buttonText: Wording.backToHome,
                  textStyle: FontHelper.h7Regular(
                    color: Palette.white,
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteName.landingScreen,
                      (route) => false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Wording.dateVisit,
              style: FontHelper.h8Regular(),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              "Rabu, 15 Juni 2022",
              style: FontHelper.h7Bold(),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Wording.time,
              style: FontHelper.h8Regular(),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              "08.00 - Selesai",
              style: FontHelper.h7Bold(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPolyAndDoctorSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.poly,
                style: FontHelper.h8Regular(),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Gigi",
                style: FontHelper.h7Bold(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Wording.doctor,
                style: FontHelper.h8Regular(),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Dr. Ali Faisal",
                style: FontHelper.h7Bold(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMedicalNumberSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Wording.medicalRecordNumber,
          style: FontHelper.h8Regular(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          "MD-2019-117953",
          style: FontHelper.h7Bold(),
        ),
      ],
    );
  }

  Widget _buildGreetingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Wording.thanks,
          style: FontHelper.h8Bold(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          Wording.thanksGreeting,
          style: FontHelper.h7Regular(),
        ),
      ],
    );
  }
}
