import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/core/core.dart';

class SignInCubit extends Cubit<BaseState> {
  final BaseLocalStorageClient localStorageClient;

  SignInCubit({
    required this.localStorageClient,
  }) : super(InitializedState());
}
