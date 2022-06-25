part of 'base_poly_repository.dart';

class PolyRepository extends BasePolyRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  PolyRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<Poly>> getPoly({
    required String token,
  }) async {
    List<Poly> _results = [];

    Response _fetch = await apiClient.get(
      baseUrl + Url.polySchedule,
      token: token,
    );

    if (_fetch.data != null && _fetch.data['data'] != null) {
      List _rawData = _fetch.data['data'];
      for (Map singleData in _rawData) {
        _results.add(
          Poly.fromJson(
            Map<String, dynamic>.from(singleData),
          ),
        );
      }
    }

    return _results;
  }
}
