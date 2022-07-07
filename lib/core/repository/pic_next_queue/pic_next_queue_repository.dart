part of 'base_pic_next_queue_repository.dart';

class PicNextQueueRepository extends BasePicNextQueueRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  PicNextQueueRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<bool?> nextQueue({
    required String token,
    required int scheduleId,
  }) async {
    bool? _resultStatus;

    Response _fetch = await apiClient.post(
      baseUrl + Url.nextQueue,
      token: token,
      data: {
        'doctor_schedule_id': scheduleId,
      },
    );

    if (_fetch.data['status'] != null) {
      print("===> _fetch.data['status']: ${_fetch.data['status']}");
      final result = json.encode(_fetch.data['status']);
      print("===> result: $result");

      _resultStatus = _fetch.data['status'];
      print("===> _resultStatus: $_resultStatus");
    }

    return _resultStatus;
  }
}
