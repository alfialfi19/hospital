import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../ui.dart';

class DoctorSelectionScreen extends StatelessWidget {
  const DoctorSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyQueue? _myQueueData;

    if (ModalRoute.of(context)!.settings.arguments is MyQueue) {
      _myQueueData = ModalRoute.of(context)!.settings.arguments as MyQueue;
    }

    return BlocProvider(
      create: (context) => DoctorScheduleCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        doctorScheduleRepository: context.read<BaseDoctorScheduleRepository>(),
      )..getData(poly: _myQueueData?.poly?.id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.doctorSelection),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: ListView(
          padding: const EdgeInsets.all(
            26.0,
          ),
          children: [
            _buildHeaderSection(
              context,
              selectedDate: _myQueueData?.date,
            ),
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
                      action: () {
                        _myQueueData = _myQueueData?.copyWith(
                          doctorSchedule: data[index],
                        );

                        Navigator.pushNamed(
                          context,
                          RouteName.detailRegistrationScreen,
                          arguments: ScreenArgument(
                            data: _myQueueData,
                          ),
                        );
                      },
                      doctorName: data[index].doctor?.name ?? "-",
                      doctorPoly: data[index].poly?.name ?? "-",
                      scheduleDesc:
                          "Jam ${data[index].startHour ?? '-'} s/d ${data[index].endHour ?? '-'}",
                      profilePic: data[index].doctor?.gender == "L"
                          ? Images.manProfile
                          : Images.womanProfile,
                      quotaAllow: data[index].quota.toString(),
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
    String convertedDate = DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(
      DateTime.parse(selectedDate ?? "-"),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${Wording.dateVisit} ->$convertedDate",
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
