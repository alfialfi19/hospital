import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/bloc/pic_schedule_detail/pic_schedule_detail_cubit.dart';

import '../../../core/core.dart';
import '../../ui.dart';

class QueueList extends StatelessWidget {
  const QueueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PicSchedule? _picSchedule;
    Poly? _poly;

    if (ModalRoute.of(context)!.settings.arguments is Map) {
      var mapData = ModalRoute.of(context)!.settings.arguments as Map;

      _picSchedule = mapData['pic_schedule'];
      _poly = mapData['poly'];
    }

    return BlocProvider(
      create: (context) => PicNextQueueCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        picNextQueueRepository: context.read<BasePicNextQueueRepository>(),
      ),
      child: QueueListContent(
        picSchedule: _picSchedule,
        poly: _poly,
      ),
    );
  }
}

class QueueListContent extends StatefulWidget {
  final PicSchedule? picSchedule;
  final Poly? poly;

  const QueueListContent({
    Key? key,
    this.picSchedule,
    this.poly,
  }) : super(key: key);

  @override
  State<QueueListContent> createState() => _QueueListContentState();
}

class _QueueListContentState extends State<QueueListContent> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PicScheduleDetailCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        picScheduleDetailRepository:
            context.read<BasePicScheduleDetailRepository>(),
      )..getData(scheduleId: widget.picSchedule!.id!),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.queueList),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<PicScheduleDetailCubit, BaseState>(
                builder: (context, state) {
                  PicScheduleDetail? data;

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
                    print("===> data data: ${jsonEncode(data)}");
                  }

                  return BlocListener<PicNextQueueCubit, BaseState>(
                    listener: (context, actionState) {
                      if (actionState is SuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Palette.hospitalPrimary,
                            content: Text("Berhasil Next Antrian"),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        setState(() {
                          _isLoading = false;
                        });

                        context
                            .read<PicScheduleDetailCubit>()
                            .getData(scheduleId: widget.picSchedule!.id!);
                      }

                      if (actionState is EmptyState ||
                          actionState is ErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Palette.red,
                            content: Text("Gagal Next Antrian"),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: ListView(
                      padding: const EdgeInsets.all(
                        26.0,
                      ),
                      children: [
                        _buildHeaderSection(
                          context,
                          data,
                          widget.poly,
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
                          itemCount: data?.queues?.length,
                          itemBuilder: (context, index) {
                            return PatientListItem(
                              patientName:
                                  data?.queues?[index].patient?.name ?? "-",
                              queueNumber:
                                  'Antrian Nomor ${data?.queues?[index].queueNo ?? "-"}',
                              profilePic: data?.queues?[index].patient?.gender,
                              isFinish: data!.queues![index].isFinish!,
                              action: () {
                                if (data?.queues?[index].isFinish != null &&
                                    data?.queues?[index].isFinish == true) {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.updateCheckPatientForm,
                                    arguments: ScreenArgument(
                                      data: {
                                        'pic_schedule': widget.picSchedule,
                                        'poly': widget.poly,
                                        'queue': data?.queues?[index],
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                        // PatientListItem(
                        //   patientName: 'Rizki Alfi',
                        //   queueNumber: 'Antrian Nomor 1',
                        // ),
                        // PatientListItem(
                        //   patientName: 'Muhammad Alfi',
                        //   queueNumber: 'Antrian Nomor 2',
                        // ),
                        // PatientListItem(
                        //   patientName: 'Tisa Ayunda',
                        //   queueNumber: 'Antrian Nomor 3',
                        //   profilePic: Images.womanProfile,
                        // ),
                        // PatientListItem(
                        //   patientName: 'Rizki Rizaldi',
                        //   queueNumber: 'Antrian Nomor 4',
                        // ),
                      ],
                    ),
                  );
                },
              ),
              !_isLoading
                  ? Positioned(
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
                          onTap: () {
                            setState(() {
                              _isLoading = true;
                            });

                            context.read<PicNextQueueCubit>().getData(
                                  // scheduleId: 1,
                                  scheduleId: widget.picSchedule!.id!,
                                );
                          },
                        ),
                      ),
                    )
                  : Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26.0,
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Palette.hospitalPrimary,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(
    BuildContext context,
    PicScheduleDetail? scheduleDetail,
    Poly? poly,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          poly?.name ?? "-",
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
              scheduleDetail?.total.toString() ?? "0",
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
              scheduleDetail?.currentQueue.toString() ?? "0",
              style: FontHelper.h7Bold(),
            ),
          ],
        ),
      ],
    );
  }
}
