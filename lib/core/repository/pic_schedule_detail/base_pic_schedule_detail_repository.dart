import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'pic_schedule_detail_repository.dart';

abstract class BasePicScheduleDetailRepository {
  Future<PicScheduleDetail?> getPicScheduleDetail({
    required String token,
    required int scheduleId,
  });
}
