import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'transaction_history_repository.dart';

abstract class BaseTransactionHistoryRepository {
  Future<List<TransactionHistory>> getTransactionHistory({
    required String token,
  });
}
