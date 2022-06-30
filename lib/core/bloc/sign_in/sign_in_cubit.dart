import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class SignInCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;
  final BaseSignInRepository authenticationRepository;
  final BaseProfileRepository profileRepository;

  SignInCubit({
    required this.localStorageClient,
    required this.authenticationRepository,
    required this.profileRepository,
  }) : super(InitializedState());

  Future<void> signInWithEmail({
    required String? email,
    required String? password,
  }) async {
    emit(LoadingState());
    Token? token;
    UserHospital? _newUserHospital;

    try {
      if (email == null ||
          email.isEmpty ||
          password == null ||
          password.isEmpty) {
        return emit(
          ErrorState(error: 'Email / password isEmpty'),
        );
        return;
      } else {
        token = await authenticationRepository.signInWithEmail(
          email: email,
          password: password,
        );

        if (token == null) {
          return emit(
            ErrorState(error: 'Token result is null'),
          );
          return;
        }
      }
    } catch (e) {
      return emit(ErrorState(error: '$this: $e'));
    }

    var tokenEncoded = jsonEncode(token.toJson());

    localStorageClient.saveByKey(
      tokenEncoded,
      SharedPrefKey.token,
      SharedPrefType.string,
    );

    try {
      _newUserHospital = await profileRepository.getUserProfile(
        token: token.accessToken!,
      );

      if (_newUserHospital == null) {
        throw Exception();
      }
    } catch (e) {
      emit(
        ErrorState(
          error: '$this - Get Profile Data] - Error : $e',
          timestamp: DateTime.now(),
        ),
      );
      return;
    }

    await localStorageClient.saveByKey(
      jsonEncode(
        _newUserHospital.toJson(),
      ),
      SharedPrefKey.userData,
      SharedPrefType.string,
    );

    emit(
      SuccessState(
        data: _newUserHospital,
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
