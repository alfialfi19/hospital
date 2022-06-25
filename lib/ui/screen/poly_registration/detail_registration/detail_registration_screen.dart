import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../ui.dart';

class DetailRegistrationScreen extends StatelessWidget {
  const DetailRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyQueue? _myQueueData;

    if (ModalRoute.of(context)!.settings.arguments is MyQueue) {
      _myQueueData = ModalRoute.of(context)!.settings.arguments as MyQueue;
      print("====> HAI HAI myQueue decode: ${json.encode(_myQueueData)}");
    }

    return BlocProvider(
      create: (context) => CreateQueueCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        createQueueRepository: context.read<BaseCreateQueueRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.detailQueueList),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: BlocListener<CreateQueueCubit, BaseState>(
          listener: (context, state) {
            print("====> this is state: $state");
            print("====> this is state data: ${state.data}");
          },
          child: SafeArea(
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.all(
                    26.0,
                  ),
                  children: [
                    _buildDateTimeSection(
                      context,
                      myQueueData: _myQueueData,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _buildPolyAndDoctorSection(
                      context,
                      myQueueData: _myQueueData,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _buildMedicalNumberSection(
                      context,
                      myQueueData: _myQueueData,
                    ),
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
                      // onTap: () => Navigator.pushNamed(
                      //   context,
                      //   RouteName.myQueueScreen,
                      //   arguments: ScreenArgument(
                      //     data: _myQueueData,
                      //   ),
                      // ),
                      onTap: () {
                        context.read<CreateQueueCubit>().createData(
                              myQueue: _myQueueData!,
                            );

                        Navigator.pushNamed(
                          context,
                          RouteName.myQueueScreen,
                          arguments: ScreenArgument(
                            data: _myQueueData,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeSection(
    BuildContext context, {
    MyQueue? myQueueData,
  }) {
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
              DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(
                DateTime.parse(myQueueData?.date ?? "-"),
              ),
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
              "${myQueueData?.doctorSchedule?.startHour ?? '-'} - ${myQueueData?.doctorSchedule?.endHour ?? '-'}",
              style: FontHelper.h7Bold(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPolyAndDoctorSection(
    BuildContext context, {
    MyQueue? myQueueData,
  }) {
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
                myQueueData?.poly?.name ?? "-",
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
                myQueueData?.doctorSchedule?.doctor?.name ?? "-",
                style: FontHelper.h7Bold(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMedicalNumberSection(
    BuildContext context, {
    MyQueue? myQueueData,
  }) {
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
          "MD-${myQueueData?.userHospital?.medicalRecord ?? '-'}",
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
