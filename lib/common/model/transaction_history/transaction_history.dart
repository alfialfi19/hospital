import 'package:hospital/common/common.dart';

class TransactionHistory extends BaseModel {
  final int? id;
  final String? diagnoseResult;
  final String? disease;
  final String? startDate;
  final String? endDate;
  final Queue? queue;

  TransactionHistory({
    this.id,
    this.diagnoseResult,
    this.disease,
    this.startDate,
    this.endDate,
    this.queue,
  }) : super({
          'id': id,
          'diagnose_result': diagnoseResult,
          'disease': disease,
          'start_date': startDate,
          'end_date': endDate,
          'queue': queue,
        });

  factory TransactionHistory.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return TransactionHistory(
      id: json['id'],
      diagnoseResult: json['diagnose_result'],
      disease: json['disease'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      queue: Queue.fromJson(json['queue']),
    );
  }

  @override
  copyWith({
    int? id,
    String? diagnoseResult,
    String? disease,
    String? startDate,
    String? endDate,
    Queue? queue,
  }) {
    return TransactionHistory(
      id: id ?? this.id,
      diagnoseResult: diagnoseResult ?? this.diagnoseResult,
      disease: disease ?? this.disease,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      queue: queue ?? this.queue,
    );
  }
}
