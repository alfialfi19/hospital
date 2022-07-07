import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class PicCheckResultCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BasePicCheckResultRepository picCheckResultRepository;

  PicCheckResultCubit({
    required this.localStorageClient,
    required this.picCheckResultRepository,
  }) : super(InitializedState());

  void getData({
    required int queueId,
    required String diagnoseResult,
    required String diseaseDescription,
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
      _result = await picCheckResultRepository.checkResult(
        token: _token.accessToken!,
        queueId: queueId,
        diagnoseResult: diagnoseResult,
        diseaseDescription: diseaseDescription,
      );

      if (_result == null || _result == false) {
        return emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Check Result Data] - Error : $e',
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
