import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class HospitalCubit extends Cubit<BaseState<Hospital>> {
  final BaseLocalStorageClient localStorageClient;
  final BaseHospitalRepository hospitalRepository;

  HospitalCubit(
      {required this.localStorageClient, required this.hospitalRepository})
      : super(InitializedState());

  void getData() async {
    emit(LoadingState());
    Hospital? _hospitalDetail;
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
      _hospitalDetail = await hospitalRepository.getHospitalDetail(
        token: _token.accessToken!,
      );

      if (_hospitalDetail != null) {
        emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get Hospital Detail Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    emit(
      LoadedState(
        data: _hospitalDetail,
        timestamp: DateTime.now(),
      ),
    );
  }
}
