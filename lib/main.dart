import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cryptoCoinsListApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'repositories/cryptoCoins/cryptoCoin.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started');

  final dio = Dio();
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    )
  );

  dio.interceptors.add(
    TalkerDioLogger(
        talker: talker,
        settings: TalkerDioLoggerSettings(
          printResponseData: false,
        )
    ),
);
  
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: dio));

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
  
  runZonedGuarded(
    () => runApp(const CryptoCurrenciesListApp()), 
    (error, stack) => GetIt.I<Talker>().handle(error, stack)
  );
  
}

