import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
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
    int userType = 1; //it's just for dummy

    Widget content;
    Widget contentBottom;

    if (userType == 0) {
      content = Column(
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
    } else {
      content = Column(
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
          _buildHeader(context),
          _buildMenu(context),
        ],
      );
    }

    if (userType == 0) {
      contentBottom = Container();
    } else {
      contentBottom = _buildBottom(context);
    }

    return Scaffold(
      body: Stack(
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
                        "Rizki Alfi Ramdhani",
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
              // Text(
              //   Wording.hello + ",",
              //   style: FontHelper.h7Regular(
              //     color: Palette.greyLighten1,
              //   ),
              // ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              // Text(
              //   "Rizki Alfi Ramdhani",
              //   style: FontHelper.h6Bold(),
              // ),
              const SizedBox(
                height: 50.0,
              ),
              content,
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: contentBottom,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
                "Poli Mata",
                style: FontHelper.h7Regular(
                  color: Palette.white,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Dr. Wiwiek Sagita",
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
                "10",
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

  Widget _buildMenu(BuildContext context) {
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
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
            "5",
            style: FontHelper.h6Bold(
              color: Palette.white,
            ),
          ),
        ],
      ),
    );
  }
}
