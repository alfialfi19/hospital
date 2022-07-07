import 'package:hospital/common/common.dart';

class PatientQueues extends BaseModel {
  final int? id;
  final Patient? patient;
  final int? queueNo;
  final bool? isFinish;

  PatientQueues({
    this.id,
    this.patient,
    this.queueNo,
    this.isFinish,
  }) : super({
          'id': id,
          'patient': patient,
          'queue_no': queueNo,
          'is_finish': isFinish,
        });

  factory PatientQueues.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return PatientQueues(
      id: json['id'],
      patient: Patient.fromJson(json['patient']),
      queueNo: json['queue_no'],
      isFinish: json['is_finish'] ?? false,
    );
  }

  @override
  copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}
