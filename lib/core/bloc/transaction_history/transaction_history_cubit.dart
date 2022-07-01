import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class TransactionHistoryCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BaseTransactionHistoryRepository transactionHistoryRepository;

  TransactionHistoryCubit({
    required this.localStorageClient,
    required this.transactionHistoryRepository,
  }) : super(InitializedState());

  void getData() async {
    emit(LoadingState());
    List<TransactionHistory> _results = [];
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
      _results = await transactionHistoryRepository.getTransactionHistory(
        token: _token.accessToken!,
      );

      if (_results.isEmpty) {
        return emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get Transaction History Data] - Error : $e',
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
