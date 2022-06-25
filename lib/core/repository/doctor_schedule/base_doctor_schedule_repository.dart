import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'doctor_schedule_repository.dart';

abstract class BaseDoctorScheduleRepository {
  Future<List<DoctorSchedule>> getDoctorSchedule({
    required String token,
    int? day,
    int? polyId,
  });
}
