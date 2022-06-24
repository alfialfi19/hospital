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
    emit(LoadingState());
    UserHospital? _newUserHospital;
    print("====> masuk getData profileCubit");

    /// Hit Api to Get Updated Data
    try {
      print("====> masuk TRY");
      print("====> masuk _token: ${_tokenData.accessToken}");
      _newUserHospital = await profileRepository.getUserProfile(
        token: _tokenData.accessToken!,
      );
      print("====> newUserHospital: $_newUserHospital");
      print("====> newUserHospital: ${_newUserHospital?.name}");
      print("====> newUserHospital: ${_newUserHospital?.userData}");

      if (_newUserHospital == null) {
        throw Exception();
      }
    } on UnauthorizedException {
      profileRepository.signOut(
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

    /// Save UserData to Local Data
    try {
      print("===> enter TRY save to localData");
      print("===> enter save toJson: ${jsonEncode(_newUserHospital.toJson())}");
      await localStorageClient.saveByKey(
        jsonEncode(
          _newUserHospital.toJson(),
        ),
        SharedPrefKey.userData,
        SharedPrefType.string,
      );
      var test = await localStorageClient.getByKey(
        SharedPrefKey.userData,
        SharedPrefType.string,
      );
      print("===> test: $test");
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

  Future<void> signOut() async {
    emit(LoadingState());

    var result;

    try {
      result = await profileRepository.signOut(
        token: _tokenData.accessToken!,
      );
    } catch (e) {
      emit(ErrorState(error: '$this: $e'));
    }

    emit(SuccessState(
      data: result,
      timestamp: DateTime.now(),
    ));
  }
}
