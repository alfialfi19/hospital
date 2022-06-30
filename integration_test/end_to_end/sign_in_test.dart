import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/app.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/client/client.dart';
import 'package:hospital/core/core.dart';
import 'package:hospital/ui/ui.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  // Clients instantiation
  final BaseLocalStorageClient _localStorageClient =
      SharedPreferenceClient.instance;
  final BaseApiClient _apiClient = DioClient.instance;

  // Environment instantiation
  const String _baseUrl = EnvConfig.baseProdUrl;

  // Repositories instantiation
  final BaseSignInRepository _authenticationRepository = SignInRepository(
    apiClient: _apiClient,
    localStorageClient: _localStorageClient,
    baseUrl: _baseUrl,
  );
  final BaseProfileRepository _profileRepository = ProfileRepository(
    apiClient: _apiClient,
    localStorageClient: _localStorageClient,
    baseUrl: _baseUrl,
  );
  final BaseDoctorScheduleRepository _doctorScheduleRepository =
      DoctorScheduleRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );
  final BaseTransactionHistoryRepository _transactionHistoryRepository =
      TransactionHistoryRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );
  final BaseHospitalRepository _hospitalRepository = HospitalRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );
  final BaseNotificationRepository _notificationRepository =
      NotificationRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );
  final BasePolyRepository _polyRepository = PolyRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );
  final BaseCreateQueueRepository _createQueueRepository =
      CreateQueueRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );
  final BaseMyQueueRepository _myQueueRepository = MyQueueRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );

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
        authenticationRepository: _authenticationRepository,
        transactionHistoryRepository: _transactionHistoryRepository,
        notificationRepository: _notificationRepository,
      ),
    );
  }

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
        await Future.delayed(const Duration(seconds: 3));

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

        // Tap sign in button
        await tester.tap(
          find.byKey(
            const Key(UIKeys.signInFormButton),
          ),
        );
        await tester.pumpAndSettle();

        // Landing screen loaded
        await expectLater(find.byType(LandingScreen), findsOneWidget);
        await tester.pump(const Duration(seconds: 5));

        // Tap profile screen
        await tester.tap(
          find.byKey(
            const Key(UIKeys.discoverProfileTabInActive),
          ),
        );
        await tester.pump(const Duration(milliseconds: 5000));
      });
    });
  });
}
