import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController edtHospital = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtPassword = TextEditingController();
  TextEditingController edtPasswordConfirm = TextEditingController();

  @override
  void dispose() {
    edtHospital.dispose();
    edtEmail.dispose();
    edtPassword.dispose();
    edtPasswordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.hospitalPrimary,
      ),
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          color: Palette.white,
          padding: const EdgeInsets.all(26.0),
          child: ListView(
            children: [
              Text(
                Wording.register,
                style: FontHelper.h5Bold(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                Wording.registerGreeting,
                style: FontHelper.h7Regular(
                  color: Palette.greyLighten2,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 40.0,
                child: TextField(
                  controller: edtHospital,
                  decoration: InputDecoration(
                    labelText: Wording.hospital,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.greyLighten2,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.hospitalPrimary,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40.0,
                child: TextField(
                  controller: edtEmail,
                  decoration: InputDecoration(
                    labelText: Wording.email,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.greyLighten2,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.hospitalPrimary,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40.0,
                child: TextField(
                  controller: edtPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: Wording.password,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.greyLighten2,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.hospitalPrimary,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40.0,
                child: TextField(
                  controller: edtPasswordConfirm,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: Wording.passwordConfirm,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.greyLighten2,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Palette.hospitalPrimary,
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              PrimaryButton(
                buttonText: Wording.next,
                onTap: () => Navigator.pushNamed(
                  context,
                  RouteName.bioScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
