part of 'base_pic_confirm_queue_repository.dart';

class PicConfirmQueueRepository extends BasePicConfirmQueueRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  PicConfirmQueueRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<PicConfirmQueue?> getPicSchedule({
    required String token,
  }) async {
    PicConfirmQueue? _result;

    Response _fetch = await apiClient.get(
      baseUrl + Url.picPolySchedule,
      token: token,
    );
    print("===> masuk fetch: $_fetch");

    if (_fetch.data != null && _fetch.data['data'] != null) {
      final _rawData = _fetch.data['data'];
      final result = json.encode(_rawData);

      _result = PicConfirmQueue.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(
            result,
          ),
        ),
      );
    }

    print("===> masuk results: $_result");

    return _result;
  }
}
