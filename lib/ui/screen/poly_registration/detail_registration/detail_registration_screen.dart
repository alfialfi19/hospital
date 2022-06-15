import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../../ui.dart';

class DetailRegistrationScreen extends StatelessWidget {
  const DetailRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.detailQueueList),
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
                _buildDataRecheckSection(context),
              ],
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
                  buttonText: Wording.register,
                  textStyle: FontHelper.h7Regular(
                    color: Palette.white,
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteName.myQueueScreen,
                  ),
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

  Widget _buildDataRecheckSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Wording.checkAgain,
          style: FontHelper.h8Bold(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          Wording.checkGreeting,
          style: FontHelper.h7Regular(),
        ),
      ],
    );
  }
}
