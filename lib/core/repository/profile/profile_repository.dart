part of 'base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseApiClient apiClient;
  final BaseLocalStorageClient localStorageClient;
  final String baseUrl;

  ProfileRepository({
    required this.apiClient,
    required this.localStorageClient,
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
      final _rawData = _fetch.data['data'];
      final result = json.encode(_rawData);

      _userHospital = UserHospital.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(
            result,
          ),
        ),
      );
    }

    return _userHospital;
  }

  @override
  Future<void> signOut({
    required String token,
  }) async {
    Response _fetch = await apiClient.post(
      baseUrl + Url.authLogout,
    );

    if (_fetch.data != null) {
      localStorageClient.clearAll();
    }
  }
}
