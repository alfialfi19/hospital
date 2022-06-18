import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/ui.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtPassword = TextEditingController();

  @override
  void dispose() {
    edtEmail.dispose();
    edtPassword.dispose();
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
          alignment: Alignment.center,
          child: ListView(
            children: [
              Text(
                Wording.welcomeWord,
                style: FontHelper.h6Bold(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                Wording.loginToContinue,
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
                height: 40.0,
              ),
              PrimaryButton(
                buttonText: Wording.login,
                // onTap: () => Navigator.pushReplacementNamed(
                //   context,
                //   RouteName.landingScreen,
                // ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Palette.red,
                      content: Text('Email atau password anda salah'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50.0,
              ),
              Image.asset(
                Images.signInBottomImage,
                fit: BoxFit.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
