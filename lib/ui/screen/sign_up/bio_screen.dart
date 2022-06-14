import 'package:flutter/material.dart';
import 'package:hospital/common/common.dart';

import '../../ui.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  TextEditingController edtIdNo = TextEditingController();
  TextEditingController edtFullName = TextEditingController();
  TextEditingController edtGender = TextEditingController();
  TextEditingController edtBirthdate = TextEditingController();
  TextEditingController edtTelephone = TextEditingController();
  TextEditingController edtAddress = TextEditingController();

  @override
  void dispose() {
    edtIdNo.dispose();
    edtFullName.dispose();
    edtGender.dispose();
    edtBirthdate.dispose();
    edtTelephone.dispose();
    edtAddress.dispose();
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
                Wording.bio,
                style: FontHelper.h5Bold(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                Wording.bioGreeting,
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
                  controller: edtIdNo,
                  decoration: InputDecoration(
                    labelText: Wording.idNo,
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
                  controller: edtFullName,
                  decoration: InputDecoration(
                    labelText: Wording.fullName,
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
                  controller: edtGender,
                  decoration: InputDecoration(
                    labelText: Wording.gender,
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
                  controller: edtBirthdate,
                  decoration: InputDecoration(
                    labelText: Wording.birthdate,
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
                  controller: edtTelephone,
                  decoration: InputDecoration(
                    labelText: Wording.telephone,
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
              TextField(
                controller: edtAddress,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: Wording.address,
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
              const SizedBox(
                height: 40.0,
              ),
              PrimaryButton(
                buttonText: Wording.register,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteName.landingScreen,
                  (route) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
