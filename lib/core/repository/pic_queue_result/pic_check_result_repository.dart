part of 'base_pic_check_result_repository.dart';

class PicCheckResultRepository extends BasePicCheckResultRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  PicCheckResultRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<bool?> checkResult({
    required String token,
    required int queueId,
    required String diagnoseResult,
    required String diseaseDescription,
  }) async {
    bool? _resultStatus;

    print("====> queueId: $queueId");
    print("====> diagnoseResult: $diagnoseResult");
    print("====> diseaseDescription: $diseaseDescription");
    Response _fetch = await apiClient.post(
      baseUrl + Url.updateResult,
      token: token,
      data: {
        'queue_id': queueId,
        'diagnose_result': diagnoseResult,
        'disease_description': diseaseDescription,
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
