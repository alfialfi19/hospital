import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class UpdateCheckPatientList extends StatelessWidget {
  const UpdateCheckPatientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Wording.updateCheckResult),
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
              RouteName.updateCheckPatientForm,
            ),
            doctorName: "Rizki Alfi",
            doctorPoly: "Poli Mata",
            scheduleDesc: "04 April 2022",
            profilePic: Images.manProfile,
          ),
          DoctorListItem(
            action: () => Navigator.pushNamed(
              context,
              RouteName.updateCheckPatientForm,
            ),
            doctorName: "Tisa Ayunda",
            doctorPoly: "Poli Umum",
            scheduleDesc: "09 Maret 2022",
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
          "Daftar Antrian",
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
                text: Wording.updateQueueNote,
                style: FontHelper.h9Regular(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
