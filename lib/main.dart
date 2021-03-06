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

  final BasePicConfirmQueueRepository _picConfirmQueueRepository =
      PicConfirmQueueRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );

  final BasePicScheduleDetailRepository _picScheduleDetailRepository =
      PicScheduleDetailRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );

  final BasePicNextQueueRepository _picNextQueueRepository =
      PicNextQueueRepository(
    apiClient: _apiClient,
    baseUrl: _baseUrl,
  );

  final BasePicCheckResultRepository _picCheckResultRepository =
      PicCheckResultRepository(
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
        polyRepository: _polyRepository,
        createQueueRepository: _createQueueRepository,
        myQueueRepository: _myQueueRepository,
        picConfirmQueueRepository: _picConfirmQueueRepository,
        picScheduleDetailRepository: _picScheduleDetailRepository,
        picNextQueueRepository: _picNextQueueRepository,
        picCheckResultRepository: _picCheckResultRepository,
      ),
    ),
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
