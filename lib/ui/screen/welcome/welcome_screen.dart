import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/ui.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          color: Palette.white,
          padding: const EdgeInsets.all(26.0),
          child: ListView(
            children: [
              Text(
                "Complete \nHealth \nSolutions",
                style: FontHelper.h5Bold(
                  color: Palette.hospitalPrimary,
                ),
              ),
              const SizedBox(
                height: 90.0,
              ),
              Image.asset(
                Images.iconApp,
                height: 240.0,
                width: 190.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 90.0,
              ),
              PrimaryButton(
                buttonText: Wording.login,
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteName.signInScreen,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              PrimaryButton(
                buttonText: Wording.register,
                textStyle: FontHelper.h7Regular(
                  color: Palette.hospitalPrimary,
                ),
                buttonColor: Palette.white,
                onTap: () => print("Register Pressed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
