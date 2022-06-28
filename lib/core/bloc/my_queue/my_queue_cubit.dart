import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/core/core.dart';

import '../../../common/common.dart';

class MyQueueCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BaseMyQueueRepository myQueueRepository;

  MyQueueCubit({
    required this.localStorageClient,
    required this.myQueueRepository,
  }) : super(InitializedState());

  void getData() async {
    emit(LoadingState());

    Queue? _result;
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
      _result = await myQueueRepository.getMyQueue(
        token: _token.accessToken!,
      );

      if (_result == null) {
        emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          data: 'Gagal get data antrian',
          error: '$this - Create Queue Data] - Error : $e',
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
