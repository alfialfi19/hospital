import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class SignInCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BaseSignInRepository authenticationRepository;

  SignInCubit({
    required this.localStorageClient,
    required this.authenticationRepository,
  }) : super(InitializedState());

  Future<void> signInWithEmail({
    required String? email,
    required String? password,
  }) async {
    emit(LoadingState());
    Token? token;

    try {
      if (email == null ||
          email.isEmpty ||
          password == null ||
          password.isEmpty) {
        emit(
          ErrorState(error: 'Email / password isEmpty'),
        );
        return;
      } else {
        token = await authenticationRepository.signInWithEmail(
          email: email,
          password: password,
        );

        if (token == null) {
          emit(
            ErrorState(error: 'Token result is null'),
          );
          return;
        }
      }
    } catch (e) {
      emit(ErrorState(error: '$this: $e'));
    }

    var tokenEncoded = jsonEncode(token?.toJson());

    localStorageClient.saveByKey(
      tokenEncoded,
      SharedPrefKey.token,
      SharedPrefType.string,
    );

    emit(
      SuccessState(
        data: token,
        timestamp: DateTime.now(),
      ),
    );
  }

  Future<void> signOut() async {
    emit(LoadingState());

    String _rawToken = await localStorageClient.getByKey(
      SharedPrefKey.token,
      SharedPrefType.string,
    );

    Token _token = Token.fromJson(
      Map<String, dynamic>.from(
        jsonDecode(_rawToken),
      ),
    );

    try {
      await authenticationRepository.signOut(
        token: _token.accessToken!,
      );
    } catch (e, s) {
      print("===> e: $e");
      print("===> s: $s");
      return emit(ErrorState(error: '$this: $e'));
    }

    emit(
      SuccessState(
        timestamp: DateTime.now(),
      ),
    );
  }
}
