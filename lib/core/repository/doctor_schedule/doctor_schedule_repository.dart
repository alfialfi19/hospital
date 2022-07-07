part of 'base_doctor_schedule_repository.dart';

class DoctorScheduleRepository extends BaseDoctorScheduleRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  DoctorScheduleRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<DoctorSchedule>> getDoctorSchedule({
    required String token,
    int? day,
    int? polyId,
  }) async {
    List<DoctorSchedule> _results = [];

    Response _fetch = await apiClient.get(
      baseUrl + Url.doctorSchedule,
      token: token,
    );
    print("===> masuk fetch: $_fetch");

    if (_fetch.data != null && _fetch.data['data'] != null) {
      List _rawData = _fetch.data['data'];
      for (Map singleData in _rawData) {
        _results.add(
          DoctorSchedule.fromJson(
            Map<String, dynamic>.from(singleData),
          ),
        );
      }
    }
    print("===> masuk results: $_results");

    return _results;
  }
}
