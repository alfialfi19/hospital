part of 'base_create_queue_repository.dart';

class CreateQueueRepository extends BaseCreateQueueRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  CreateQueueRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<QueueRegistration?> createQueue({
    required String token,
    required String date,
    required DoctorSchedule doctorSchedule,
  }) async {
    QueueRegistration? _queueRegistration;
    String selectedDate = date;

    String convertedDate = selectedDate.substring(0, 10);

    Response _fetch = await apiClient.post(
      baseUrl + Url.createQueue,
      token: token,
      data: {
        "date": convertedDate,
        "doctor_schedule_id": doctorSchedule.id,
      },
    );
    print("====> fetch: $_fetch");
    print("====> fetch data: ${_fetch.data['data']}");
    print("====> fetch data queue No: ${_fetch.data['data']}");

    if (_fetch.data != null && _fetch.data['data'] != null) {
      final _rawData = _fetch.data['data'];
      final result = json.encode(_rawData);

      _queueRegistration = QueueRegistration.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(
            result,
          ),
        ),
      );
    }
    print("====> _queueNo: ${_queueRegistration?.queue}");

    return _queueRegistration;
  }
}
