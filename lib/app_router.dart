import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/ui/screen/about_us/about_us_screen.dart';
import 'package:hospital/ui/screen/doctor_list/doctor_list_screen.dart';
import 'package:hospital/ui/screen/doctor_schedule/doctor_schedule_screen.dart';
import 'package:hospital/ui/screen/queue_confirm/queue_confirm.dart';
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

      case RouteName.signUpScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.signUpScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const SignUpScreen(),
                )
              : const SignUpScreen(),
        );

      case RouteName.bioScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.bioScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: const BioScreen(),
                )
              : const BioScreen(),
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

      case RouteName.notificationScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.notificationScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: NotificationScreen(),
                )
              : NotificationScreen(),
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

      case RouteName.aboutUsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.aboutUsScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: AboutUsScreen(),
                )
              : AboutUsScreen(),
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

      case RouteName.polyScheduleScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.polyScheduleScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: PolyScheduleScreen(),
                )
              : PolyScheduleScreen(),
        );

      case RouteName.polyListScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.polyListScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: PolyListScreen(),
                )
              : PolyListScreen(),
        );

      case RouteName.doctorSelectionScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.doctorSelectionScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: DoctorSelectionScreen(),
                )
              : DoctorSelectionScreen(),
        );

      case RouteName.detailRegistrationScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.detailRegistrationScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: DetailRegistrationScreen(),
                )
              : DetailRegistrationScreen(),
        );

      case RouteName.myQueueScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.myQueueScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: MyQueueScreen(),
                )
              : MyQueueScreen(),
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

      case RouteName.editProfileScreen:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.editProfileScreen,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: EditProfileScreen(),
                )
              : EditProfileScreen(),
        );

      case RouteName.queueDoctorList:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.queueDoctorList,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: QueueDoctorList(),
                )
              : QueueDoctorList(),
        );

      case RouteName.queueList:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.queueList,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: QueueList(),
                )
              : QueueList(),
        );

      case RouteName.updateCheckPatientList:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.updateCheckPatientList,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: UpdateCheckPatientList(),
                )
              : UpdateCheckPatientList(),
        );

      case RouteName.updateCheckPatientForm:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RouteName.updateCheckPatientForm,
            arguments: args?.data,
          ),
          builder: (_) => args?.bloc != null
              ? BlocProvider.value(
                  value: args!.bloc!,
                  child: UpdateCheckPatientForm(),
                )
              : UpdateCheckPatientForm(),
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
