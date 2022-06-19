part of 'base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  ProfileRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<UserHospital?> getUserProfile({
    required String token,
  }) async {
    UserHospital? _userHospital;
    Response _fetch = await apiClient.get(
      baseUrl + Url.profile,
      token: token,
    );

    if (_fetch.data != null && _fetch.data['data'] != null) {
      _userHospital = UserHospital.fromJson(
        _fetch.data['data'],
      );
    }

    return _userHospital;
  }
}
