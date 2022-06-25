import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/app.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/client/local_storage/local_storage.dart';
import 'package:hospital/core/core.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Clients instantiations
  final BaseLocalStorageClient _localStorageClient =
      SharedPreferenceClient.instance;
  final BaseApiClient _apiClient = DioClient.instance;

  // Environment instantiation
  const String _baseUrl = EnvConfig.baseProdUrl;

  // Repositories instantiations
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

  // Disable Landscape Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  initializeDateFormatting('id_ID', null);

  runZonedGuarded(
    () => runApp(
      App(
        //Client
        apiClient: _apiClient,
        localStorageClient: _localStorageClient,
        //Repository
        authenticationRepository: _authenticationRepository,
        profileRepository: _profileRepository,
        doctorScheduleRepository: _doctorScheduleRepository,
        transactionHistoryRepository: _transactionHistoryRepository,
        hospitalRepository: _hospitalRepository,
        notificationRepository: _notificationRepository,
      ),
    ),
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
