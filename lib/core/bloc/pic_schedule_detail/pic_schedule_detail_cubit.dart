import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class PicScheduleDetailCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BasePicScheduleDetailRepository picScheduleDetailRepository;

  PicScheduleDetailCubit({
    required this.localStorageClient,
    required this.picScheduleDetailRepository,
  }) : super(InitializedState());

  void getData({
    required int scheduleId,
  }) async {
    emit(LoadingState());
    PicScheduleDetail? _result;
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
      _result = await picScheduleDetailRepository.getPicScheduleDetail(
        token: _token.accessToken!,
        scheduleId: scheduleId,
      );

      if (_result == null) {
        return emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get PIC Schedule byID Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    emit(
      LoadedState(
        data: _result,
        timestamp: DateTime.now(),
      ),
    );
  }
}
