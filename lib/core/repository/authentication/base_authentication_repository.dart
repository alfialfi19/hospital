import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

part 'authentication_repository.dart';

abstract class BaseAuthenticationRepository {
  Future<Token?> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
