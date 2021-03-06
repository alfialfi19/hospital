import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';
import 'package:hospital/ui/ui.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final UserHospital? userData;

  const HomeScreen({
    Key? key,
    this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userType = userData?.userData?.userType ?? "-"; //it's just for dummy

    return BlocProvider(
      create: (context) => MyQueueCubit(
        localStorageClient: context.read<BaseLocalStorageClient>(),
        myQueueRepository: context.read<BaseMyQueueRepository>(),
      )..getData(),
      child: HomeContent(
        userType: userType,
        userData: userData,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final UserHospital? userData;
  final String? userType;

  const HomeContent({
    Key? key,
    this.userData,
    this.userType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyQueueCubit, BaseState>(
        builder: (context, state) {
          Queue? data;
          bool _isEmpty = false;

          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Palette.hospitalPrimary,
              ),
            );
          }

          if (state is ErrorState) {
            // return Center(
            //   child: Text(
            //     Wording.somethingWentWrong,
            //     style: FontHelper.h7Regular(),
            //   ),
            // );
            _isEmpty = true;
          }

          if (state is EmptyState) {
            // return Center(
            //   child: Text(
            //     Wording.noData,
            //     style: FontHelper.h7Regular(),
            //   ),
            // );
            _isEmpty = true;
          }

          if (state is LoadedState) {
            data = state.data;
          }

          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(
                  26.0,
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Wording.hello + ",",
                            style: FontHelper.h7Regular(
                              color: Palette.greyLighten1,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            userData?.name?.capitalize() ?? "-",
                            style: FontHelper.h6Bold(),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          RouteName.notificationScreen,
                        ),
                        child: const Icon(
                          Icons.add_alert_rounded,
                          color: Palette.hospitalPrimary,
                          size: 26.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  if (userType == 'USER') ...[
                    _buildUserContent(
                      context,
                      myQueue: data,
                    ),
                  ] else ...[
                    _buildPICContent(context),
                  ],
                ],
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: userType == 'USER'
                    ? _buildBottom(
                        context,
                        myQueue: data,
                      )
                    : Container(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPICContent(BuildContext context) {
    return Column(
      children: [
        PicMenuItem(
          icon: Icons.list_alt_outlined,
          title: Wording.queueConfirm,
          action: () => Navigator.pushNamed(
            context,
            RouteName.queueDoctorList,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        PicMenuItem(
          icon: Icons.people_alt_rounded,
          title: Wording.updateCheckResult,
          action: () => Navigator.pushNamed(
            context,
            RouteName.updateCheckPatientList,
          ),
        ),
      ],
    );
  }

  Widget _buildUserContent(
    BuildContext context, {
    Queue? myQueue,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Wording.appTitle,
              style: FontHelper.h7Bold(
                color: Palette.hospitalSecondary,
              ),
            ),
            Text(
              DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(
                DateTime.now(),
              ),
              style: FontHelper.h7Regular(
                color: Palette.hospitalSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        _buildHeader(
          context,
          myQueue: myQueue,
        ),
        _buildMenu(
          context,
          userHospital: userData,
        ),
      ],
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    Queue? myQueue,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          9.0,
        ),
        color: Palette.hospitalPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myQueue?.doctorSchedule?.poly?.name ?? "-",
                style: FontHelper.h7Regular(
                  color: Palette.white,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                myQueue?.doctorSchedule?.doctor?.name ?? "-",
                style: FontHelper.h7Bold(
                  color: Palette.white,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Wording.queue,
                style: FontHelper.h7Regular(
                  color: Palette.white,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                myQueue?.queueNo.toString() ?? "-",
                style: FontHelper.h5Bold(
                  color: Palette.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(
    BuildContext context, {
    UserHospital? userHospital,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuItem(
            textMenu: Wording.queueList,
            iconMenu: Icons.list_alt_rounded,
            actionMenu: () => Navigator.pushNamed(
              context,
              RouteName.polyScheduleScreen,
              arguments: ScreenArgument(
                data: userData,
              ),
            ),
          ),
          MenuItem(
            textMenu: Wording.doctorSchedule,
            iconMenu: Icons.people_alt_rounded,
            actionMenu: () => Navigator.pushNamed(
              context,
              RouteName.doctorScheduleScreen,
            ),
          ),
          MenuItem(
            key: const Key(UIKeys.transactionHistoryMenu),
            textMenu: Wording.checkHistory,
            iconMenu: Icons.bar_chart,
            actionMenu: () => Navigator.pushNamed(
              context,
              RouteName.checkHistoryListScreen,
            ),
          ),
          MenuItem(
            textMenu: Wording.emergencyCall,
            iconMenu: Icons.emergency_rounded,
            actionMenu: () => Navigator.pushNamed(
              context,
              RouteName.aboutUsScreen,
              arguments: ScreenArgument(
                data: UserHospital(
                  userData: userData?.userData,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context, {Queue? myQueue}) {
    return Container(
      color: Palette.hospitalPrimary,
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Wording.existingQueue,
            style: FontHelper.h7Regular(
              color: Palette.white,
            ),
          ),
          Text(
            myQueue?.currentQueue.toString() ?? "0",
            style: FontHelper.h6Bold(
              color: Palette.white,
            ),
          ),
        ],
      ),
    );
  }
}
