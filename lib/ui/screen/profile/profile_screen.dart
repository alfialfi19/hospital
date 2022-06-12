import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/ui.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  final UserHospital? userData;

  const ProfileScreen({
    Key? key,
    this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          26.0,
        ),
        children: [
          Text(
            Wording.profile,
            style: FontHelper.h5Bold(),
          ),
          const SizedBox(
            height: 50.0,
          ),
          _buildUserInfo(context),
          const SizedBox(
            height: 50.0,
          ),
          _buildProfileItem(context),
          const SizedBox(
            height: 50.0,
          ),
          _buildProfileAction(context),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Images.manProfile,
          width: 70.0,
          height: 70.0,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "Rizki Alfi Ramdhani",
          style: FontHelper.h7Bold(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          "rizki.alfi@mekari.com",
          style: FontHelper.h8Regular(
            color: Palette.greyLighten1,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileItem(
          valueItem: DateFormat("dd MMMM yyyy", "id_ID").format(
            DateTime.now(),
          ),
          titleItem: Wording.lastVisit,
        ),
        const ProfileItem(
          valueItem: "17",
          titleItem: Wording.totalVisit,
        ),
        const ProfileItem(
          valueItem: "MD-2019-117953",
          titleItem: Wording.medicalRecordNumber,
        ),
      ],
    );
  }

  Widget _buildProfileAction(BuildContext context) {
    return Column(
      children: [
        ProfileAction(
          iconAction: Icons.settings,
          titleAction: Wording.changeProfile,
          action: () => print("Change profile pressed"),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Divider(),
        const SizedBox(
          height: 10.0,
        ),
        ProfileAction(
          iconAction: Icons.arrow_right_alt_rounded,
          titleAction: Wording.logout,
          action: () => print("Logout pressed"),
        ),
      ],
    );
  }
}
