import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/app_router.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class App extends StatelessWidget {
  final BaseLocalStorageClient localStorageClient;
  final BaseApiClient apiClient;

  // Repositories
  final BaseSignInRepository authenticationRepository;
  final BaseProfileRepository profileRepository;
  final BaseDoctorScheduleRepository doctorScheduleRepository;
  final BaseTransactionHistoryRepository transactionHistoryRepository;
  final BaseHospitalRepository hospitalRepository;
  final BaseNotificationRepository notificationRepository;
  final BasePolyRepository polyRepository;
  final BaseCreateQueueRepository createQueueRepository;
  final BaseMyQueueRepository myQueueRepository;
  final BasePicConfirmQueueRepository picConfirmQueueRepository;
  final BasePicScheduleDetailRepository picScheduleDetailRepository;
  final BasePicNextQueueRepository picNextQueueRepository;

  const App({
    Key? key,
    required this.localStorageClient,
    required this.apiClient,
    required this.authenticationRepository,
    required this.profileRepository,
    required this.doctorScheduleRepository,
    required this.transactionHistoryRepository,
    required this.hospitalRepository,
    required this.notificationRepository,
    required this.polyRepository,
    required this.createQueueRepository,
    required this.myQueueRepository,
    required this.picConfirmQueueRepository,
    required this.picScheduleDetailRepository,
    required this.picNextQueueRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => localStorageClient,
        ),
        RepositoryProvider(
          create: (context) => apiClient,
        ),
        RepositoryProvider(
          create: (context) => authenticationRepository,
        ),
        RepositoryProvider(
          create: (context) => profileRepository,
        ),
        RepositoryProvider(
          create: (context) => doctorScheduleRepository,
        ),
        RepositoryProvider(
          create: (context) => transactionHistoryRepository,
        ),
        RepositoryProvider(
          create: (context) => hospitalRepository,
        ),
        RepositoryProvider(
          create: (context) => notificationRepository,
        ),
        RepositoryProvider(
          create: (context) => polyRepository,
        ),
        RepositoryProvider(
          create: (context) => createQueueRepository,
        ),
        RepositoryProvider(
          create: (context) => myQueueRepository,
        ),
        RepositoryProvider(
          create: (context) => picConfirmQueueRepository,
        ),
        RepositoryProvider(
          create: (context) => picScheduleDetailRepository,
        ),
        RepositoryProvider(
          create: (context) => picNextQueueRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppSetupCubit()..initialize(),
          ),
          BlocProvider(
            create: (context) => TabCubit(),
          ),
          BlocProvider(
            create: (context) => AuthenticationDataCubit(
              appSetupCubit: context.read<AppSetupCubit>(),
              localStorageClient: localStorageClient,
            ),
          ),
          BlocProvider(
            create: (context) => SignInCubit(
              localStorageClient: localStorageClient,
              authenticationRepository: context.read<BaseSignInRepository>(),
              profileRepository: context.read<BaseProfileRepository>(),
            ),
          ),
        ],
        child: const HospitalApp(),
      ),
    );
  }
}

class HospitalApp extends StatefulWidget {
  const HospitalApp({Key? key}) : super(key: key);

  @override
  State<HospitalApp> createState() => _HospitalAppState();
}

class _HospitalAppState extends State<HospitalApp> {
  final AppRouter _appRouter = AppRouter();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  DateTime? _lastUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: _appRouter.onGenerateRoute,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationDataCubit, BaseState>(
                listener: (context, state) {
                  UserHospital? user;

                  if (state is AuthenticatedState) {
                    if (_lastUser == null) {
                      _lastUser = state.timestamp;
                      user = state.data;
                      // Trigger Patch Change Tab
                      context.read<TabCubit>().changeTab(tab: AppTab.home);
                      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                        RouteName.landingScreen,
                        (route) => false,
                        arguments: ScreenArgument(
                          data: UserHospital(
                            nik: user?.nik,
                            name: user?.name,
                            medicalRecord: user?.medicalRecord,
                            birthDate: user?.birthDate,
                            gender: user?.gender,
                            address: user?.address,
                            phone: user?.phone,
                            userData: user?.userData,
                          ),
                        ),
                      );
                    }
                  }

                  if (state is UnauthenticatedState) {
                    _lastUser = null;
                    // Can navigate to login/register screen if needed
                    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      RouteName.welcomeScreen,
                      (route) => false,
                    );
                  }
                },
              ),
            ],
            child: child!,
          ),
        );
      },
    );
  }
}
