import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/app_router.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/core.dart';

class App extends StatelessWidget {
  final BaseLocalStorageClient localStorageClient;
  final BaseApiClient apiClient;

  const App({
    Key? key,
    required this.localStorageClient,
    required this.apiClient,
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
                            email: user?.email,
                            username: user?.fullName,
                            fullName: user?.fullName,
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
