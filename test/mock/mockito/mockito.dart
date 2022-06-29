import 'package:hospital/core/core.dart';
import 'package:mockito/annotations.dart';

export 'bloc/bloc.dart';
export 'client/client.dart';
export 'repository/repository.dart';

@GenerateMocks([
  // Bloc
  AppSetupCubit,
  AuthenticationDataCubit,
  AuthenticationActionCubit,
  TabCubit,
  // Clients
  BaseApiClient,
  BaseLocalStorageClient,
  // Repositories
  BaseCreateQueueRepository,
  BaseDoctorScheduleRepository,
  BaseHospitalRepository,
  BaseMyQueueRepository,
  BasePolyRepository,
  BaseProfileRepository,
  BaseSignInRepository,
  BaseTransactionHistoryRepository,
  BaseNotificationRepository,
])
void main() {}
