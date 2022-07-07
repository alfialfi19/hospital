part of 'base_pic_schedule_detail_repository.dart';

class PicScheduleDetailRepository extends BasePicScheduleDetailRepository {
  final BaseApiClient apiClient;
  final String baseUrl;

  PicScheduleDetailRepository({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<PicScheduleDetail?> getPicScheduleDetail({
    required String token,
    required int scheduleId,
  }) async {
    PicScheduleDetail? _result;

    Response _fetch = await apiClient.get(
      baseUrl + Url.picPolySchedule + '/$scheduleId',
      token: token,
    );
    print("===> fetch fetch: $_fetch");

    if (_fetch.data != null && _fetch.data['data'] != null) {
      final _rawData = _fetch.data['data'];
      final result = json.encode(_rawData);

      _result = PicScheduleDetail.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(
            result,
          ),
        ),
      );
    }

    return _result;
  }
}
