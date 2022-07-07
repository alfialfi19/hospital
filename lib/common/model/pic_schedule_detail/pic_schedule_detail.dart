import 'package:hospital/common/common.dart';

class PicScheduleDetail extends BaseModel {
  final int? total;
  final int? currentQueue;
  final List<PatientQueues>? queues;

  PicScheduleDetail({
    this.total,
    this.currentQueue,
    this.queues,
  }) : super({
          'total': total,
          'current_queue': currentQueue,
          'queues': queues,
        });

  factory PicScheduleDetail.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    List<PatientQueues> _queues = [];

    if (json['queues'] != null && json['queues'].isNotEmpty) {
      List<PatientQueues> _tempQueues = [];

      for (Map<String, dynamic> data in json['queues']) {
        _tempQueues.add(PatientQueues.fromJson(data));
      }

      _queues = _tempQueues;
    }

    return PicScheduleDetail(
      total: json['total'],
      currentQueue: json['current_queue'],
      queues: _queues,
    );
  }

  @override
  copyWith({
    int? total,
    int? currentQueue,
    List<PatientQueues>? queues,
  }) {
    return PicScheduleDetail(
      total: total ?? this.total,
      currentQueue: currentQueue ?? this.currentQueue,
      queues: queues ?? this.queues,
    );
  }
}
