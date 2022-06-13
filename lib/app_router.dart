import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/screen/doctor_list/doctor_list_screen.dart';
import 'package:hospital/ui/screen/doctor_schedule/doctor_schedule_screen.dart';
import 'package:hospital/ui/ui.dart';

class AppRouter {
  /// Delegates for screen routing
  Route onGenerateRoute(RouteSettings routeSettings) {
    final ScreenArgument? args = routeSettings.arguments != null
        ? routeSettings.arguments as ScreenArgument
        : null;
    switch (routeSettings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.splashScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SplashScreen(),
                )
              : const SplashScreen(),
        );

      case RouteName.welcomeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.welcomeScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const WelcomeScreen(),
                )
              : const WelcomeScreen(),
        );

      case RouteName.signInScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.signInScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SignInScreen(),
                )
              : const SignInScreen(),
        );

      case RouteName.landingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.landingScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: LandingScreen(),
                )
              : LandingScreen(),
        );

      case RouteName.homeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.homeScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: HomeScreen(),
                )
              : HomeScreen(),
        );

      case RouteName.checkHistoryListScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.checkHistoryListScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: CheckHistoryListScreen(),
                )
              : CheckHistoryListScreen(),
        );

      case RouteName.checkHistoryDetailScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.checkHistoryDetailScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: CheckHistoryDetailScreen(),
                )
              : CheckHistoryDetailScreen(),
        );

      case RouteName.doctorScheduleScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.doctorScheduleScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: DoctorScheduleScreen(),
                )
              : DoctorScheduleScreen(),
        );

      case RouteName.doctorListScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.doctorListScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: DoctorListScreen(),
                )
              : DoctorListScreen(),
        );

      case RouteName.profileScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.profileScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: ProfileScreen(),
                )
              : ProfileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
