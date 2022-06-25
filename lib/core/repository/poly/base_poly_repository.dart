import 'package:dio/dio.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

part 'poly_repository.dart';

abstract class BasePolyRepository {
  Future<List<Poly>> getPoly({
    required String token,
  });
}
