// Mocks generated by Mockito 5.2.0 from annotations
// in hospital/test/mock/mockito/mockito.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:hospital/common/common.dart' as _i4;
import 'package:hospital/core/core.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [BaseMyQueueRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseMyQueueRepository extends _i1.Mock
    implements _i2.BaseMyQueueRepository {
  MockBaseMyQueueRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Queue?> getMyQueue({String? token}) =>
      (super.noSuchMethod(Invocation.method(#getMyQueue, [], {#token: token}),
          returnValue: Future<_i4.Queue?>.value()) as _i3.Future<_i4.Queue?>);
}
