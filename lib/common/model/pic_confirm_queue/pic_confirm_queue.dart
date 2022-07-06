import 'package:hospital/common/common.dart';

class PicConfirmQueue extends BaseModel {
  final Poly? poly;
  final PicSchedule? picSchedule;

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

    return PicConfirmQueue(
      poly: Poly.fromJson(json['poli']),
      picSchedule: PicSchedule.fromJson(json['schedule']),
    );
  }

  @override
  copyWith({
    Poly? poly,
    PicSchedule? picSchedule,
  }) {
    return PicConfirmQueue(
      poly: poly ?? this.poly,
      picSchedule: picSchedule ?? this.picSchedule,
    );
  }
}
