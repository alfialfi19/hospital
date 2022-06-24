import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class DoctorScheduleCubit extends Cubit<BaseState> {
  final SignInCubit signInCubit;
  final BaseLocalStorageClient localStorageClient;
  final BaseDoctorScheduleRepository doctorScheduleRepository;

  late Token _tokenData;

  DoctorScheduleCubit({
    required this.signInCubit,
    required this.localStorageClient,
    required this.doctorScheduleRepository,
  }) : super(InitializedState()) {
    _tokenData = signInCubit.state.data!;
  }

  void getData({
    String? day,
    String? poly,
  }) async {
    emit(LoadingState());
    List<DoctorSchedule> _results = [];

    try {
      _results = await doctorScheduleRepository.getDoctorSchedule(
        token: _tokenData.accessToken!,
        day: day,
        polyId: poly,
      );

      if (_results.isEmpty) {
        emit(EmptyState());
      }
    } catch (e) {
      return emit(
        ErrorState(
          error: '$this - Get Doctor Schedule Data] - Error : $e',
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
