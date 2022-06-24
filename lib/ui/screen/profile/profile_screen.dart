import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';
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
    return BlocListener<SignInCubit, BaseState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Palette.red,
              content: Text('Silahkan coba lagi'),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is SuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.welcomeScreen,
            (route) => false,
          );
        }
      },
      child: Scaffold(
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
            _buildUserInfo(
              context,
              userData: userData,
            ),
            const SizedBox(
              height: 50.0,
            ),
            _buildProfileItem(
              context,
              userData: userData,
            ),
            const SizedBox(
              height: 50.0,
            ),
            _buildProfileAction(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(
    BuildContext context, {
    UserHospital? userData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          userData?.gender == "L" ? Images.manProfile : Images.womanProfile,
          width: 70.0,
          height: 70.0,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          userData?.name?.capitalize() ?? "-",
          style: FontHelper.h7Bold(),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          userData?.userData?.email ?? "-",
          style: FontHelper.h8Regular(
            color: Palette.greyLighten1,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileItem(
    BuildContext context, {
    UserHospital? userData,
  }) {
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
        ProfileItem(
          valueItem: "MD-${userData?.medicalRecord ?? '-'}",
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
          action: () => Navigator.pushNamed(
            context,
            RouteName.editProfileScreen,
          ),
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
          action: () => context.read<SignInCubit>().signOut(),
        ),
      ],
    );
  }
}
