import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';

import '../../../core/core.dart';
import '../../ui.dart';

class QueueDoctorList extends StatelessWidget {
  const QueueDoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PicConfirmQueueCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        picConfirmQueueRepository:
            context.read<BasePicConfirmQueueRepository>(),
      )..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.doctorList),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: BlocBuilder<PicConfirmQueueCubit, BaseState>(
          builder: (context, state) {
            PicConfirmQueue? data;

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

            return ListView(
              padding: const EdgeInsets.all(
                26.0,
              ),
              children: [
                _buildHeaderSection(
                  context,
                  data,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SearchBar(),
                const SizedBox(
                  height: 20.0,
                ),
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data?.picSchedule?.length,
                  itemBuilder: (context, index) {
                    return DoctorListItem(
                      action: () => Navigator.pushNamed(
                        context,
                        RouteName.queueList,
                        arguments: ScreenArgument(
                          data: {
                            'pic_schedule': data?.picSchedule?[index],
                            'poly': data?.poly,
                          },
                        ),
                      ),
                      doctorName: data?.picSchedule?[index].doctor?.name ?? "-",
                      doctorPoly: data?.poly?.name ?? "-",
                      scheduleDesc:
                          "Jam ${data?.picSchedule?[index].startHour ?? '-'} s/d ${data?.picSchedule?[index].endHour ?? '-'}",
                      profilePic:
                          data?.picSchedule?[index].doctor?.gender == "L"
                              ? Images.manProfile
                              : Images.womanProfile,
                    );
                  },
                ),
                // DoctorListItem(
                //   action: () =>
                //       Navigator.pushNamed(
                //         context,
                //         RouteName.queueList,
                //       ),
                //   doctorName: "Dr. Andre Taulany",
                //   doctorPoly: "",
                //   scheduleDesc: "Jam 08:00 s/d 12:00",
                //   profilePic: Images.manProfile,
                // ),
                // DoctorListItem(
                //   action: () =>
                //       Navigator.pushNamed(
                //         context,
                //         RouteName.queueList,
                //       ),
                //   doctorName: "Dr. Siti Badriyah",
                //   doctorPoly: "",
                //   scheduleDesc: "Jam 09:00 s/d 12:00",
                //   profilePic: Images.womanProfile,
                // ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderSection(
    BuildContext context,
    PicConfirmQueue? picConfirmQueue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // "Poli Anak",
          picConfirmQueue?.poly?.name ?? "-",
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
