import 'package:hospital/common/common.dart';

class MyQueue extends BaseModel {
  final String? date;
  final String? time;
  final Poly? poly;
  final DoctorSchedule? doctorSchedule;
  final UserHospital? userHospital;
  final QueueRegistration? myQueue;

  MyQueue({
    this.date,
    this.time,
    this.poly,
    this.doctorSchedule,
    this.userHospital,
    this.myQueue,
  }) : super({
          'date': date,
          'time': time,
          'poli': poly,
          'doctor_schedule': doctorSchedule,
          'user_hospital': userHospital,
          'myQueue': myQueue,
        });

  factory MyQueue.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided');
    }

    return MyQueue(
      date: json['date'],
      time: json['time'],
      poly: Poly.fromJson(json['poli']),
      doctorSchedule: DoctorSchedule.fromJson(json['doctor_schedule']),
      userHospital: UserHospital.fromJson(json['user_hospital']),
      myQueue: json['myQueue'],
    );
  }

  @override
  copyWith({
    String? date,
    String? time,
    Poly? poly,
    DoctorSchedule? doctorSchedule,
    UserHospital? userHospital,
    QueueRegistration? myQueue,
  }) {
    return MyQueue(
      date: date ?? this.date,
      time: time ?? this.time,
      poly: poly ?? this.poly,
      doctorSchedule: doctorSchedule ?? this.doctorSchedule,
      userHospital: userHospital ?? this.userHospital,
      myQueue: myQueue ?? this.myQueue,
    );
  }
}
