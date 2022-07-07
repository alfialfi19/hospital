import 'package:hospital/common/common.dart';

class PicConfirmQueue extends BaseModel {
  final Poly? poly;
  final List<PicSchedule>? picSchedule;

  PicConfirmQueue({
    this.poly,
    this.picSchedule,
  }) : super({
          'poli': poly,
          'schedule': picSchedule,
        });

  factory PicConfirmQueue.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    List<PicSchedule> _picSchedule = [];

    if (json['schedule'] != null && json['schedule'].isNotEmpty) {
      List<PicSchedule> _tempSchedule = [];

      for (Map<String, dynamic> data in json['schedule']) {
        _tempSchedule.add(PicSchedule.fromJson(data));
      }

      _picSchedule = _tempSchedule;
    }

    return PicConfirmQueue(
      poly: Poly.fromJson(json['poli']),
      picSchedule: _picSchedule,
    );
  }

  @override
  copyWith({
    Poly? poly,
    List<PicSchedule>? picSchedule,
  }) {
    return PicConfirmQueue(
      poly: poly ?? this.poly,
      picSchedule: picSchedule ?? this.picSchedule,
    );
  }
}
