import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'pic_next_queue_repository.dart';

abstract class BasePicNextQueueRepository {
  Future<bool?> nextQueue({
    required String token,
    required int scheduleId,
  });
}
