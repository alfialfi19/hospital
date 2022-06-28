part of 'base_my_queue_repository.dart';

class MyQueueRepository extends BaseMyQueueRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  MyQueueRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<Queue?> getMyQueue({
    required String token,
  }) async {
    Queue? _queueResult;

    Response _fetchData = await apiClient.get(
      baseUrl + Url.createQueue,
      token: token,
    );

    print("====> fetch: $_fetchData");
    print("====> fetch data: ${_fetchData.data['data']}");

    if (_fetchData.data != null && _fetchData.data['data'] != null) {
      final _rawData = _fetchData.data['data'];
      final result = json.encode(_rawData);

      _queueResult = Queue.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(result),
        ),
      );
    }
    print("====> _queueResult: ${_queueResult?.toJson()}");

    return _queueResult;
  }
}
