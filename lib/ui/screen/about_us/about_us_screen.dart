import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

import '../../ui.dart';

// ignore: must_be_immutable
class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  UserHospital? userData;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments is UserHospital) {
      userData = ModalRoute.of(context)!.settings.arguments as UserHospital;
    }

    return BlocProvider(
      create: (context) => HospitalCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        hospitalRepository: context.read<BaseHospitalRepository>(),
      )..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Wording.hospitalInformation),
          backgroundColor: Palette.hospitalPrimary,
        ),
        body: SafeArea(
          child: BlocBuilder<HospitalCubit, BaseState>(
            builder: (context, state) {
              Hospital? _hospitalDetail;

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
                _hospitalDetail = state.data;
              }

              return ListView(
                padding: const EdgeInsets.all(
                  26.0,
                ),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Wording.name,
                        style: FontHelper.h8Bold(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        _hospitalDetail?.name ?? "-",
                        style: FontHelper.h8Regular(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Wording.classes,
                        style: FontHelper.h8Bold(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        _hospitalDetail?.hospitalClass ?? "-",
                        style: FontHelper.h8Regular(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Wording.telephone,
                        style: FontHelper.h8Bold(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        _hospitalDetail?.phone ?? "-",
                        style: FontHelper.h8Regular(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Wording.address,
                        style: FontHelper.h8Bold(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        _hospitalDetail?.address ?? "-",
                        style: FontHelper.h8Regular(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
