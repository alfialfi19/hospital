import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class DoctorScheduleCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BaseDoctorScheduleRepository doctorScheduleRepository;

  DoctorScheduleCubit({
    required this.localStorageClient,
    required this.doctorScheduleRepository,
  }) : super(InitializedState());

  void getData({
    String? day,
    String? poly,
  }) async {
    print("====> enter get Data");
    emit(LoadingState());
    List<DoctorSchedule> _results = [];
    Token _token;

    try {
      String _rawToken = await localStorageClient.getByKey(
        SharedPrefKey.token,
        SharedPrefType.string,
      );

      _token = Token.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(_rawToken),
        ),
      );
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get Token From Local] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    try {
      _results = await doctorScheduleRepository.getDoctorSchedule(
        token: _token.accessToken!,
        day: day,
        polyId: poly,
      );
      print("====> enter results: $_results");
      print("====> enter results doctorName: ${_results.first.doctor?.name}");

      if (_results.isEmpty) {
        emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get Doctor Schedule Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    emit(
      LoadedState(
        data: _results,
        timestamp: DateTime.now(),
      ),
    );
  }
}
