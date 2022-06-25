import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class PolyCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BasePolyRepository polyRepository;

  PolyCubit({
    required this.localStorageClient,
    required this.polyRepository,
  }) : super(InitializedState());

  void getData() async {
    emit(LoadingState());
    List<Poly> _results = [];
    Token _token;

    try {
      String _rawToken = await localStorageClient.getByKey(
        SharedPrefKey.token,
        SharedPrefType.string,
      );

      _token = Token.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(_rawToken),
        ),
      );
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get Token From Local] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    try {
      _results = await polyRepository.getPoly(
        token: _token.accessToken!,
      );

      if (_results.isEmpty) {
        emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get Poly Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
    }

    emit(
      LoadedState(
        data: _results,
        timestamp: DateTime.now(),
      ),
    );
  }
}
