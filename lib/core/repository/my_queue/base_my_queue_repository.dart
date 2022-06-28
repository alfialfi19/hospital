import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'my_queue_repository.dart';

abstract class BaseMyQueueRepository {
  Future<Queue?> getMyQueue({
    required String token,
  });
}
