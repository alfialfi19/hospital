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
    String? selectedDate;

    if (ModalRoute.of(context)!.settings.arguments is String) {
      selectedDate = ModalRoute.of(context)!.settings.arguments as String;
    }

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
        body: ListView(
          padding: const EdgeInsets.all(
            26.0,
          ),
          children: [
            _buildHeaderSection(context, selectedDate: selectedDate),
            const SizedBox(
              height: 20.0,
            ),
            const SearchBar(),
            const SizedBox(
              height: 20.0,
            ),
            BlocBuilder<DoctorScheduleCubit, BaseState>(
              builder: (context, state) {
                List<DoctorSchedule> data = [];

                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.hospitalPrimary,
                    ),
                  );
                }

                if (state is ErrorState) {
                  return Center(
                    child: Text(
                      Wording.somethingWentWrong,
                      style: FontHelper.h7Regular(),
                    ),
                  );
                }

                if (state is EmptyState) {
                  return Center(
                    child: Text(
                      Wording.noData,
                      style: FontHelper.h7Regular(),
                    ),
                  );
                }

                if (state is LoadedState) {
                  data = state.data;
                }

                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DoctorListItem(
                      action: () => print("Doctor pressed"),
                      doctorName: data[index].doctor?.name ?? "-",
                      doctorPoly: data[index].poly?.name ?? "-",
                      scheduleDesc:
                          "Jam ${data[index].startHour ?? '-'} s/d ${data[index].endHour ?? '-'}",
                      profilePic: data[index].doctor?.gender == "L"
                          ? Images.manProfile
                          : Images.womanProfile,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(
    BuildContext context, {
    String? selectedDate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectedDate ?? "-",
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
