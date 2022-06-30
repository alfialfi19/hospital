import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/app.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/client/client.dart';
import 'package:hospital/ui/ui.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';

import '../../test/mock/mock.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  // Clients instantiation
  final MockBaseLocalStorageClient _localStorageClient =
      MockBaseLocalStorageClient();
  final MockBaseApiClient _apiClient = MockBaseApiClient();

  // Repositories instantiation
  final MockBaseCreateQueueRepository _createQueueRepository =
      MockBaseCreateQueueRepository();
  final MockBaseDoctorScheduleRepository _doctorScheduleRepository =
      MockBaseDoctorScheduleRepository();
  final MockBaseHospitalRepository _hospitalRepository =
      MockBaseHospitalRepository();
  final MockBaseMyQueueRepository _myQueueRepository =
      MockBaseMyQueueRepository();
  final MockBasePolyRepository _polyRepository = MockBasePolyRepository();
  final MockBaseProfileRepository _profileRepository =
      MockBaseProfileRepository();
  final MockBaseSignInRepository _signInRepository = MockBaseSignInRepository();
  final MockBaseTransactionHistoryRepository _transactionHistoryRepository =
      MockBaseTransactionHistoryRepository();
  final MockBaseNotificationRepository _notificationRepository =
      MockBaseNotificationRepository();

  Future<void> pumpAppWithMockedDependency(WidgetTester tester) async {
    // Disable Landscape Mode
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    initializeDateFormatting();

    await tester.pumpWidget(
      App(
        // Clients
        apiClient: _apiClient,
        localStorageClient: _localStorageClient,
        // Repository
        createQueueRepository: _createQueueRepository,
        doctorScheduleRepository: _doctorScheduleRepository,
        hospitalRepository: _hospitalRepository,
        myQueueRepository: _myQueueRepository,
        polyRepository: _polyRepository,
        profileRepository: _profileRepository,
        authenticationRepository: _signInRepository,
        transactionHistoryRepository: _transactionHistoryRepository,
        notificationRepository: _notificationRepository,
      ),
    );
  }

  Token _mockTokenData = Token(
    accessToken: "YOUR_ACCESS_TOKEN",
    refreshToken: "YOUR_REFRESH_TOKEN",
  );

  Hospital _mockHospitalData = Hospital(
      id: 1,
      name: "Rumah Sakit",
      address: "Alamat Rumah Sakit",
      hospitalClass: "C",
      phone: "14045");

  UserData _mockUserData = UserData(
    id: 1,
    email: "email@email.com",
    hospital: _mockHospitalData,
    userType: "USER",
  );

  UserHospital _mockUserHospital = UserHospital(
    nik: "713891364",
    name: "User Testing",
    medicalRecord: "1531523",
    birthDate: "1997-11-12",
    gender: "L",
    address: "Jalan jalan yuk",
    phone: "503151341",
    userData: _mockUserData,
  );

  group('sign_in_test.dart', () {
    group('Given: Normal Test Flow', () {
      testWidgets(
          'When: User sign in - Then: Successfully sign in and '
          'redirect to Landing Screen', (WidgetTester tester) async {
        await pumpAppWithMockedDependency(tester);
        await tester.pumpAndSettle();

        // Splash Screen loaded
        expect(find.byType(SplashScreen), findsOneWidget);

        // Necessary delay for integration testing
        await Future.delayed(const Duration(seconds: 5));

        // Tap sign in screen button
        await tester.tap(
          find.byKey(
            const Key(UIKeys.signInScreenButton),
          ),
        );
        await tester.pumpAndSettle();

        // Sign in screen loaded
        await expectLater(find.byType(SignInScreen), findsOneWidget);

        // Fill email
        await tester.enterText(
          find.byKey(
            const Key(UIKeys.signInFormEmailField),
          ),
          'tes@tes.com',
        );
        await tester.pump(const Duration(milliseconds: 250));

        // Fill password
        await tester.enterText(
          find.byKey(
            const Key(UIKeys.signInFormPasswordField),
          ),
          'tes123',
        );
        await tester.pump(const Duration(milliseconds: 250));

        // Stub sign in process
        when(_signInRepository.signInWithEmail(
          email: 'tes@tes.com',
          password: 'tes123',
        )).thenAnswer(
          (_) => Future.value(
            Token(
              accessToken: _mockTokenData.accessToken,
              refreshToken: _mockTokenData.refreshToken,
            ),
          ),
        );

        when(_localStorageClient.saveByKey(
          jsonEncode(
            Token(
              accessToken: _mockTokenData.accessToken,
              refreshToken: _mockTokenData.refreshToken,
            ).toJson(),
          ),
          SharedPrefKey.token,
          SharedPrefType.string,
        )).thenAnswer(
          (_) => Future.value(
            true,
          ),
        );

        when(_profileRepository.getUserProfile(
          token: _mockTokenData.accessToken,
        )).thenAnswer(
          (_) => Future.value(
            _mockUserHospital,
          ),
        );

        when(_localStorageClient.saveByKey(
          jsonEncode(
            _mockUserHospital.toJson(),
          ),
          SharedPrefKey.userData,
          SharedPrefType.string,
        )).thenAnswer(
          (_) => Future.value(
            true,
          ),
        );

        // Tap sign in button
        await tester.tap(
          find.byKey(
            const Key(UIKeys.signInFormButton),
          ),
        );
        await tester.pumpAndSettle();

        // Landing screen loaded
        await expectLater(find.byType(LandingScreen), findsOneWidget);
        await tester.pump(const Duration(seconds: 3));

        // Tap profile screen
        await tester.tap(
          find.byKey(
            const Key(UIKeys.discoverProfileTabInActive),
          ),
        );
        await tester.pump(const Duration(milliseconds: 3000));
      });
    });

    group('Given: Failed Test Flow', () {
      testWidgets(
          'When: User sign in - Then: failed sign in and '
          'show error message', (WidgetTester tester) async {
        await pumpAppWithMockedDependency(tester);
        await tester.pumpAndSettle();

        // Splash Screen loaded
        expect(find.byType(SplashScreen), findsOneWidget);

        // Necessary delay for integration testing
        await Future.delayed(const Duration(seconds: 5));

        // Tap sign in screen button
        await tester.tap(
          find.byKey(
            const Key(UIKeys.signInScreenButton),
          ),
        );
        await tester.pumpAndSettle();

        // Sign in screen loaded
        await expectLater(find.byType(SignInScreen), findsOneWidget);

        // Fill email
        await tester.enterText(
          find.byKey(
            const Key(UIKeys.signInFormEmailField),
          ),
          'salah@tes.com',
        );
        await tester.pump(const Duration(milliseconds: 250));

        // Fill password
        await tester.enterText(
          find.byKey(
            const Key(UIKeys.signInFormPasswordField),
          ),
          'salah1233',
        );
        await tester.pump(const Duration(milliseconds: 250));

        // Stub sign in process
        when(_signInRepository.signInWithEmail(
          email: 'salah@tes.com',
          password: 'salah1233',
        )).thenAnswer(
          (_) => Future.value(
            null,
          ),
        );

        await tester.tap(
          find.byKey(
            const Key(UIKeys.signInFormButton),
          ),
        );
        await tester.pumpAndSettle();

        await tester.pump(const Duration(milliseconds: 3000));
      });
    });
  });
}
