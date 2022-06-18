part of 'base_authentication_repository.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  AuthenticationRepository({
    required this.apiClient,
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
      String _rawData = fetchData.data['data'];

      _token = Token.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(
            _rawData,
          ),
        ),
      );
    }

    return _token;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
