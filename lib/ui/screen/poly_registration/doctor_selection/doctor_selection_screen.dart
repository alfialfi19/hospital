import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../../ui.dart';

class DoctorSelectionScreen extends StatelessWidget {
  const DoctorSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.doctorSelection),
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: ListView(
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
          DoctorListItem(
            action: () => Navigator.pushNamed(
              context,
              RouteName.detailRegistrationScreen,
            ),
            doctorName: "Dr. Andre Taulany",
            doctorPoly: "Poli Gigi",
            scheduleDesc: "Jam 08:00 s/d 12:00",
            quotaAllow: "10",
            profilePic: Images.manProfile,
          ),
          DoctorListItem(
            action: () => print("Doctor 4 pressed"),
            doctorName: "Dr. Chika Cikuwa",
            doctorPoly: "Poli Penyakit Dalam",
            scheduleDesc: "Jam 10:00 s/d 15:00",
            quotaAllow: "4",
            profilePic: Images.womanProfile,
          ),
          DoctorListItem(
            action: () => print("Doctor 5 pressed"),
            doctorName: "Dr. Najwa",
            doctorPoly: "Poli Gigi",
            scheduleDesc: "Jam 12:00 s/d 15:00",
            quotaAllow: "1",
            profilePic: Images.womanProfile,
          ),
          DoctorListItem(
            action: () => print("Doctor 6 pressed"),
            doctorName: "Dr. Siti Badriyah",
            doctorPoly: "Poli Umum",
            scheduleDesc: "Jam 010:00 s/d 12:00",
            quotaAllow: "5",
            profilePic: Images.womanProfile,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${Wording.dateVisit} -> 04 Januari 2022",
          style: FontHelper.h6Bold(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        RichText(
          text: TextSpan(
            text: Wording.note,
            style: FontHelper.h9Regular(
              color: Palette.hospitalPrimary,
            ),
            children: [
              TextSpan(
                text: Wording.doctorListNotes,
                style: FontHelper.h9Regular(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
