import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'pic_confirm_queue_repository.dart';

abstract class BasePicConfirmQueueRepository {
  Future<PicConfirmQueue?> getPicSchedule({
    required String token,
  });
}
