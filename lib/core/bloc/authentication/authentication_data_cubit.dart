import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

part 'authentication_state.dart';

class AuthenticationDataCubit extends Cubit<BaseState<UserHospital>> {
  final AppSetupCubit appSetupCubit;
  final BaseLocalStorageClient localStorageClient;

  late StreamSubscription appSetupCubitSubs;

  AuthenticationDataCubit({
    required this.appSetupCubit,
    required this.localStorageClient,
  }) : super(InitializedState()) {
    appSetupCubitSubs = appSetupCubit.stream.listen((state) {
      if (state == AppSetupState.success) {
        initialize();
      }
    });
  }

  @override
  Future<void> close() {
    appSetupCubitSubs.cancel();
    return super.close();
  }

  void initialize() async {
    String? _rawUserData;
    UserHospital? _userData;

    /// Get & Check UserData from SharedPref
    try {
      _rawUserData = await localStorageClient.getByKey(
        SharedPrefKey.userData,
        SharedPrefType.string,
      );

      debugPrint('[$this - getUserData] - Result : $_rawUserData');

      if (_rawUserData == null) {
        emit(UnauthenticatedState());
        return;
      }
    } catch (e) {
      debugPrint("--->  error getUserData from pref e: $e");
      emit(UnauthenticatedState());
      return;
    }

    /// Parse RawData to Model
    try {
      _userData = UserHospital.fromJson(jsonDecode(_rawUserData));
      debugPrint('[$this] - Get Name : ${_userData.name}');

      if (_userData.name == null) {
        emit(UnauthenticatedState());
        return;
      }
    } catch (e) {
      debugPrint("---> error parse rawData to Model e: $e");
      emit(UnauthenticatedState());
      return;
    }

    /// All Passed
    emit(
      AuthenticatedState(
        data: _userData,
        timestamp: DateTime.now(),
      ),
    );
  }
}
