import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'hospital_repository.dart';

abstract class BaseHospitalRepository {
  Future<Hospital?> getHospitalDetail({
    required String token,
  });
}
