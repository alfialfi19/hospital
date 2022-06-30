// Mocks generated by Mockito 5.2.0 from annotations
// in hospital/test/mock/mockito/mockito.dart.
// Do not manually edit this file.

import 'dart:async' as _i2;

import 'package:flutter_bloc/flutter_bloc.dart' as _i5;
import 'package:hospital/common/common.dart' as _i4;
import 'package:hospital/core/bloc/tab/tab_cubit.dart' as _i3;
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

class _FakeStreamSubscription_0<T> extends _i1.Fake
    implements _i2.StreamSubscription<T> {}

/// A class which mocks [TabCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockTabCubit extends _i1.Mock implements _i3.TabCubit {
  MockTabCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AppTab get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _i4.AppTab.home) as _i4.AppTab);
  @override
  _i2.Stream<_i4.AppTab> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
          returnValue: Stream<_i4.AppTab>.empty()) as _i2.Stream<_i4.AppTab>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void changeTab({_i4.AppTab? tab}) =>
      super.noSuchMethod(Invocation.method(#changeTab, [], {#tab: tab}),
          returnValueForMissingStub: null);
  @override
  _i2.StreamSubscription<_i4.AppTab> listen(void Function(_i4.AppTab)? onData,
          {Function? onError, void Function()? onDone, bool? cancelOnError}) =>
      (super.noSuchMethod(
              Invocation.method(#listen, [
                onData
              ], {
                #onError: onError,
                #onDone: onDone,
                #cancelOnError: cancelOnError
              }),
              returnValue: _FakeStreamSubscription_0<_i4.AppTab>())
          as _i2.StreamSubscription<_i4.AppTab>);
  @override
  void emit(_i4.AppTab? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onChange(_i5.Change<_i4.AppTab>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  _i2.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i2.Future<void>);
}