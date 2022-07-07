import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class PicNextQueueCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BasePicNextQueueRepository picNextQueueRepository;

  PicNextQueueCubit({
    required this.localStorageClient,
    required this.picNextQueueRepository,
  }) : super(InitializedState());

  void getData({
    required int scheduleId,
  }) async {
    emit(LoadingState());
    bool? _result;
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
      _result = await picNextQueueRepository.nextQueue(
        token: _token.accessToken!,
        scheduleId: scheduleId,
      );

      if (_result == null || _result == false) {
        return emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Next Queue Schedule Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    emit(
      SuccessState(
        data: _result,
        timestamp: DateTime.now(),
      ),
    );
  }
}
