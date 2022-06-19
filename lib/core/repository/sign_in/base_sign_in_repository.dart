import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

part 'sign_in_repository.dart';

abstract class BaseSignInRepository {
  Future<Token?> signInWithEmail({
    required String email,
    required String password,
  });

  Future signOut({
    required String token,
  });
}
