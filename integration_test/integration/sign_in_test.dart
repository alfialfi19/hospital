import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital/app.dart';
import 'package:hospital/common/common.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../test/mock/mock.dart';

void main() {
  // final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
  //     as IntegrationTestWidgetsFlutterBinding;
  // binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

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
        });
      });

      group('Given: Failed Test Flow', () {});
    });
  }
}
