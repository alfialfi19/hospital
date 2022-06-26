import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'create_queue_repository.dart';

abstract class BaseCreateQueueRepository {
  Future<QueueRegistration?> createQueue({
    required String token,
    required String date,
    required DoctorSchedule doctorSchedule,
  });
}
