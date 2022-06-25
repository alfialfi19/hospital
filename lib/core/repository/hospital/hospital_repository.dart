part of 'base_hospital_repository.dart';

class HospitalRepository extends BaseHospitalRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  HospitalRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<Hospital?> getHospitalDetail({
    required String token,
  }) async {
    Hospital? _hospital;
    Response _fetch = await apiClient.get(
      baseUrl + Url.hospitalDetail,
      token: token,
    );

    if (_fetch.data != null && _fetch.data['data'] != null) {
      final _rawData = _fetch.data['data'];
      final result = json.encode(_rawData);

      _hospital = Hospital.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(
            result,
          ),
        ),
      );
    }

    return _hospital;
  }
}
