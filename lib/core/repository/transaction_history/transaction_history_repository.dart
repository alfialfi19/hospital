part of 'base_transaction_history_repository.dart';

class TransactionHistoryRepository extends BaseTransactionHistoryRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  TransactionHistoryRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<TransactionHistory>> getTransactionHistory({
    required String token,
  }) async {
    List<TransactionHistory> _results = [];

    Response _fetch = await apiClient.get(
      baseUrl + Url.transactionHistory,
      token: token,
    );

    if (_fetch.data != null && _fetch.data['data'] != null) {
      List _rawData = _fetch.data['data'];
      for (Map singleData in _rawData) {
        _results.add(
          TransactionHistory.fromJson(
            Map<String, dynamic>.from(singleData),
          ),
        );
      }
    }

    return _results;
  }
}
