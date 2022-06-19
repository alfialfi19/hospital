part of 'base_sign_in_repository.dart';

class SignInRepository extends BaseSignInRepository {
  final BaseApiClient apiClient;
  final BaseLocalStorageClient localStorageClient;
  final String baseUrl;

  SignInRepository({
    required this.apiClient,
    required this.localStorageClient,
    required this.baseUrl,
  });

  @override
  Future<Token?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    Token? _token;

    Response fetchData = await apiClient.post(
      baseUrl + Url.authLogin,
      data: {
        "email": email,
        "password": password,
      },
    );

    if (fetchData.data['data'] != null) {
      final _rawData = fetchData.data['data'];
      final result = json.encode(_rawData);

      _token = Token.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(
            result,
          ),
        ),
      );
    }

    return _token;
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
