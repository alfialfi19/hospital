import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            Images.iconApp,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
