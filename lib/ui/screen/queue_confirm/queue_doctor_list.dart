import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class QueueDoctorList extends StatelessWidget {
  const QueueDoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.doctorList),
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
              RouteName.queueList,
            ),
            doctorName: "Dr. Andre Taulany",
            doctorPoly: "",
            scheduleDesc: "Jam 08:00 s/d 12:00",
            profilePic: Images.manProfile,
          ),
          DoctorListItem(
            action: () => Navigator.pushNamed(
              context,
              RouteName.queueList,
            ),
            doctorName: "Dr. Siti Badriyah",
            doctorPoly: "",
            scheduleDesc: "Jam 09:00 s/d 12:00",
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
          "Poli Anak",
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
