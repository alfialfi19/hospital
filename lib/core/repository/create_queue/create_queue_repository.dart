part of 'base_create_queue_repository.dart';

class CreateQueueRepository extends BaseCreateQueueRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  CreateQueueRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<String?> createQueue({
    required String token,
    required String date,
    required DoctorSchedule doctorSchedule,
  }) async {
    String _messageResponse = "";

    Response _fetch = await apiClient.get(
      baseUrl + Url.createQueue,
      token: token,
      queryParams: {
        "date": date,
        "doctor_schedule_id": doctorSchedule.id,
      },
    );
    print("====> fetch: $_fetch");

    if (_fetch.data['message'] != null) {
      _messageResponse = _fetch.data['message'];
    }
    print("====> _messageResponse: $_messageResponse");

    return _messageResponse;
  }
}
