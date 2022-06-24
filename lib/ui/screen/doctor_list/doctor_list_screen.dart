import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/bloc/doctor_schedule/doctor_schedule_cubit.dart';
import 'package:hospital/core/core.dart';

import '../../ui.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorScheduleCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        doctorScheduleRepository: context.read<BaseDoctorScheduleRepository>(),
      )..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.doctorList),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: BlocBuilder<DoctorScheduleCubit, BaseState>(
          builder: (context, state) {
            return ListView(
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
                  action: () => print("Doctor 1 pressed"),
                  doctorName: "Dr. Andre Taulany",
                  doctorPoly: "Poli Gigi",
                  scheduleDesc: "Jam 08:00 s/d 12:00",
                  profilePic: Images.manProfile,
                ),
                DoctorListItem(
                  action: () => print("Doctor 2 pressed"),
                  doctorName: "Dr. Siti Badriyah",
                  doctorPoly: "Poli Umum",
                  scheduleDesc: "Jam 09:00 s/d 12:00",
                  profilePic: Images.womanProfile,
                ),
                DoctorListItem(
                  action: () => print("Doctor 3 pressed"),
                  doctorName: "Dr. Ali Syafaat",
                  doctorPoly: "Poli Kandungan",
                  scheduleDesc: "Jam 08:00 s/d 12:00",
                  profilePic: Images.manProfile,
                ),
                DoctorListItem(
                  action: () => print("Doctor 4 pressed"),
                  doctorName: "Dr. Chika Cikuwa",
                  doctorPoly: "Poli Penyakit Dalam",
                  scheduleDesc: "Jam 10:00 s/d 15:00",
                  profilePic: Images.womanProfile,
                ),
                DoctorListItem(
                  action: () => print("Doctor 5 pressed"),
                  doctorName: "Dr. Najwa",
                  doctorPoly: "Poli Gigi",
                  scheduleDesc: "Jam 12:00 s/d 15:00",
                  profilePic: Images.womanProfile,
                ),
                DoctorListItem(
                  action: () => print("Doctor 6 pressed"),
                  doctorName: "Dr. Siti Badriyah",
                  doctorPoly: "Poli Umum",
                  scheduleDesc: "Jam 010:00 s/d 12:00",
                  profilePic: Images.womanProfile,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "15 Juni 2022",
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
