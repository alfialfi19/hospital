import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

class CreateQueueCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BaseCreateQueueRepository createQueueRepository;

  CreateQueueCubit({
    required this.localStorageClient,
    required this.createQueueRepository,
  }) : super(InitializedState());

  void createData({
    required MyQueue myQueue,
  }) async {
    emit(LoadingState());
    String? _resultMessage = "";
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
      _resultMessage = await createQueueRepository.createQueue(
        token: _token.accessToken!,
        date: myQueue.date!,
        doctorSchedule: myQueue.doctorSchedule!,
      );

      if (_resultMessage == null) {
        emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Create Queue Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    emit(
      SuccessState(
        data: _resultMessage,
        timestamp: DateTime.now(),
      ),
    );
  }
}
