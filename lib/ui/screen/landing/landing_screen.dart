import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/ui.dart';

import '../../../core/core.dart';

// ignore: must_be_immutable
class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);

  UserHospital? userData;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments is UserHospital) {
      userData = ModalRoute.of(context)!.settings.arguments as UserHospital;
    }

    return BlocBuilder<TabCubit, AppTab>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Palette.white,
            selectedItemColor: Palette.hospitalPrimary,
            unselectedItemColor: Palette.greyLighten1,
            selectedLabelStyle: FontHelper.h9Regular(
              color: Palette.hospitalPrimary,
            ),
            unselectedLabelStyle: FontHelper.h9Regular(
              color: Palette.greyLighten1,
            ),
            showUnselectedLabels: true,
            onTap: (index) => context.read<TabCubit>().changeTab(
                  tab: AppTab.values[index],
                ),
            currentIndex: AppTab.values.indexOf(state),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.home_outlined,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.home_rounded,
                      color: Palette.hospitalPrimary,
                    ),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: const Icon(
                        Icons.person_outline_rounded,
                        color: Palette.greyLighten1,
                      ),
                    ),
                  ),
                ),
                activeIcon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: const Icon(
                      Icons.person_rounded,
                      color: Palette.hospitalPrimary,
                    ),
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
          body: _buildContent(
            state,
            userData: userData,
          ),
        );
      },
    );
  }

  Widget _buildContent(
    AppTab state, {
    UserHospital? userData,
  }) {
    if (state == AppTab.home) {
      return SafeArea(
        child: HomeScreen(
          userData: userData,
        ),
      );
    }
    if (state == AppTab.profile) {
      return SafeArea(
        child: ProfileScreen(
          userData: userData,
        ),
      );
    }

    return Container();
  }
}
