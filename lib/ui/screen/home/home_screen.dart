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
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(
              26.0,
            ),
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
              const SizedBox(
                height: 50.0,
              ),
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
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: _buildBottom(context),
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
            actionMenu: () => print("Daftar Antrian pressed"),
          ),
          MenuItem(
            textMenu: Wording.doctorSchedule,
            iconMenu: Icons.people_alt_rounded,
            actionMenu: () => print("Jadwal Dokter pressed"),
          ),
          MenuItem(
            textMenu: Wording.checkHistory,
            iconMenu: Icons.bar_chart,
            actionMenu: () => print("Riwayat Periksa pressed"),
          ),
          MenuItem(
            textMenu: Wording.emergencyCall,
            iconMenu: Icons.emergency_rounded,
            actionMenu: () => print("Emergency Call pressed"),
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