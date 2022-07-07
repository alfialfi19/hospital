import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'pic_check_result_repository.dart';

abstract class BasePicCheckResultRepository {
  Future<bool?> checkResult({
    required String token,
    required int queueId,
    required String diagnoseResult,
    required String diseaseDescription,
  });
}
