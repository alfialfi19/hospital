import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

part 'profile_repository.dart';

abstract class BaseProfileRepository {
  Future<UserHospital?> getUserProfile({
    required String token,
  });

  Future signOut({
    required String token,
  });
}
