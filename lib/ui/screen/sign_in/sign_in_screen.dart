import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';
import 'package:hospital/ui/ui.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtPassword = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    edtEmail.dispose();
    edtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        profileRepository: context.read<BaseProfileRepository>(),
        localStorageClient: context.read<BaseLocalStorageClient>(),
        signInCubit: context.read<SignInCubit>(),
      ),
      child: BlocConsumer<SignInCubit, BaseState>(
        listener: (context, state) {
          UserHospital? user;

          if (state is SuccessState) {
            _isLoading = false;

            user = state.data;

            Navigator.pushReplacementNamed(
              context,
              RouteName.landingScreen,
              arguments: ScreenArgument(
                data: UserHospital(
                  nik: user?.nik,
                  name: user?.name,
                  medicalRecord: user?.medicalRecord,
                  birthDate: user?.birthDate,
                  gender: user?.gender,
                  address: user?.address,
                  phone: user?.phone,
                  userData: user?.userData,
                ),
              ),
            );
          } else if (state is ErrorState) {
            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Palette.red,
                  content: Text(state.error),
                  duration: const Duration(seconds: 2),
                ),
              );

              _isLoading = false;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Palette.red,
                  content: Text('Email atau password anda salah'),
                  duration: Duration(seconds: 2),
                ),
              );

              _isLoading = false;
            }
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            _isLoading = true;
          }

          return Scaffold(
            key: const Key(UIKeys.signInScreenView),
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
                        key: const Key(UIKeys.signInFormEmailField),
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
                        key: const Key(UIKeys.signInFormPasswordField),
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
                    if (_isLoading) ...[
                      const Center(
                        key: Key(UIKeys.signInScreenLoadingContainer),
                        child: CircularProgressIndicator(
                          color: Palette.hospitalPrimary,
                        ),
                      ),
                    ] else ...[
                      PrimaryButton(
                        key: const Key(UIKeys.signInFormButton),
                        buttonText: Wording.login,
                        onTap: () {
                          context.read<SignInCubit>().signInWithEmail(
                                email: edtEmail.text,
                                password: edtPassword.text,
                              );
                        },
                      ),
                    ],
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
        },
      ),
    );
  }
}
