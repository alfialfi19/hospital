import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class PicConfirmQueueCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BasePicConfirmQueueRepository picConfirmQueueRepository;

  PicConfirmQueueCubit({
    required this.localStorageClient,
    required this.picConfirmQueueRepository,
  }) : super(InitializedState());

  void getData() async {
    emit(LoadingState());
    PicConfirmQueue? _result;
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
      _result = await picConfirmQueueRepository.getPicSchedule(
        token: _token.accessToken!,
      );

      if (_result == null) {
        emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get PIC Confirm Queue Schedule Data] - Error : $e',
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
