import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';

import '../../core.dart';

class AuthenticationActionCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;

  AuthenticationActionCubit({
    required this.localStorageClient,
  }) : super(InitializedState());

  /// SignOut (Clear Data & Unsubscribe FCM)
  void signOut({required UserData userData, bool isExpired = false}) async {
    emit(LoadingState());

    /// Clear All Local Data
    try {
      await localStorageClient.clearAll();
    } catch (e) {
      emit(
        ErrorState(
          error: 'Clear All Local Data Fail',
          timestamp: DateTime.now(),
        ),
      );
      return;
    }

    emit(SuccessState(data: isExpired));
  }

  /// Update User Data
  void updateUserData({
    required UserData userData,
  }) {
    emit(SuccessState(data: userData));
  }
}
