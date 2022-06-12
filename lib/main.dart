import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/app.dart';
import 'package:hospital/common/common.dart';
import 'package:hospital/core/client/local_storage/local_storage.dart';
import 'package:hospital/core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Clients instantiations
  final BaseLocalStorageClient _localStorageClient =
      SharedPreferenceClient.instance;
  final BaseApiClient _apiClient = DioClient.instance;

  // Environment instantiation
  const String _baseUrl = EnvConfig.baseProdUrl;

  // Repositories instantiations

  // Disable Landscape Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runZonedGuarded(
    () => runApp(
      App(
        //Client
        apiClient: _apiClient,
        localStorageClient: _localStorageClient,
        //Repository
        // stockRepository: _stockRepository,
      ),
    ),
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
