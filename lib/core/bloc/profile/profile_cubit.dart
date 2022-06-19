import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class ProfileCubit extends Cubit<BaseState<UserHospital>> {
  // final AuthenticationActionCubit authenticationActionCubit;
  // final AuthenticationDataCubit authenticationDataCubit;
  final SignInCubit signInCubit;
  final BaseLocalStorageClient localStorageClient;
  final BaseProfileRepository profileRepository;

  // late UserHospital _userHospital;
  late Token _tokenData;

  ProfileCubit({
    // required this.authenticationActionCubit,
    // required this.authenticationDataCubit,
    required this.signInCubit,
    required this.localStorageClient,
    required this.profileRepository,
  }) : super(InitializedState()) {
    _tokenData = signInCubit.state.data!;
  }

  void getData() async {
    UserHospital? _newUserHospital;

    /// Hit Api to Get Updated Data
    try {
      _newUserHospital = await profileRepository.getUserProfile(
        token: _tokenData.accessToken!,
      );

      if (_newUserHospital == null) {
        throw Exception();
      }
    } on UnauthorizedException {
      signInCubit.signOut(
        token: _tokenData.accessToken!,
      );

      emit(
        ErrorState(
          error: 'Expired Token',
          timestamp: DateTime.now(),
        ),
      );
      return;
    } catch (e) {
      emit(
        ErrorState(
          error: '$this - Get My Profile Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
      return;
    }

    // _newUserHospital = _newUserHospital.copyWith(
    //   token: _userData.token,
    //   fcmToken: _userData.fcmToken,
    // );

    ///Save UserData to Local Data
    try {
      await localStorageClient.saveByKey(
        jsonEncode(
          _newUserHospital!.toJson(),
        ),
        SharedPrefKey.userData,
        SharedPrefType.string,
      );
    } catch (e) {
      emit(ErrorState(
        error: 'Terjadi Kesalahan, silahkan coba lagi!',
      ));
      return;
    }

    /// All Validate Pass
    emit(
      SuccessState(
        data: _newUserHospital,
        timestamp: DateTime.now(),
      ),
    );
  }
}
