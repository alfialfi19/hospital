import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class QueueList extends StatelessWidget {
  const QueueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.queueList),
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
                _buildHeaderSection(context),
                const SizedBox(
                  height: 20.0,
                ),
                const SearchBar(),
                const SizedBox(
                  height: 20.0,
                ),
                PatientListItem(
                  patientName: 'Rizki Alfi',
                  queueNumber: 'Antrian Nomor 1',
                ),
                PatientListItem(
                  patientName: 'Muhammad Alfi',
                  queueNumber: 'Antrian Nomor 2',
                ),
                PatientListItem(
                  patientName: 'Tisa Ayunda',
                  queueNumber: 'Antrian Nomor 3',
                  profilePic: Images.womanProfile,
                ),
                PatientListItem(
                  patientName: 'Rizki Rizaldi',
                  queueNumber: 'Antrian Nomor 4',
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26.0,
                ),
                child: SquareButton(
                  buttonText: 'Antrian Selanjutnya',
                  textStyle: FontHelper.h7Regular(
                    color: Palette.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Poli Anak",
          style: FontHelper.h6Bold(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Antrian",
              style: FontHelper.h8Regular(),
            ),
            Text(
              "10",
              style: FontHelper.h7Bold(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Antrian Sekarang",
              style: FontHelper.h8Regular(),
            ),
            Text(
              "2",
              style: FontHelper.h7Bold(),
            ),
          ],
        ),
      ],
    );
  }
}
