import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cryptoCoinsListApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'repositories/cryptoCoins/cryptoCoin.dart';
import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final talker = TalkerFlutter.init();
//   GetIt.I.registerSingleton(talker);
//   GetIt.I<Talker>().debug('Talker started');

//   const cryptoCoinsBoxName = 'cryptoCoinsBox';

//   await Hive.initFlutter();
//   Hive.registerAdapter(CryptoCoinAdapter());
//   Hive.registerAdapter(CryptoCoinModelDetailsAdapter());

//   final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

//   final app = await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   talker.info(app.options.projectId);
//   final dio = Dio();
//   Bloc.observer = TalkerBlocObserver(
//     talker: talker,
//     settings: const TalkerBlocLoggerSettings(
//       printStateFullData: false,
//       printEventFullData: false,
//     )
//   );

//   dio.interceptors.add(
//     TalkerDioLogger(
//         talker: talker,
//         settings: const TalkerDioLoggerSettings(
//           printResponseData: false,
//         )
//     ),
// );

//   GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox));

//   FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

//   runZonedGuarded(
//     () => runApp(const CryptoCurrenciesListApp()),
//     (error, stack) => GetIt.I<Talker>().handle(error, stack)
//   );

// }

void main() async {
  // Сделать ошибки зоны фатальными для упрощения отладки
  // BindingBase.debugZoneErrorsAreFatal = true;

  // Убедитесь, что инициализация bindings происходит в самом начале
  

  // Если у вас есть асинхронные операции, оберните их в runZonedGuarded
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Инициализация Talker
    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug('Talker started');

    // Инициализация Hive
    await Hive.initFlutter();
    Hive.registerAdapter(CryptoCoinAdapter());
    Hive.registerAdapter(CryptoCoinModelDetailsAdapter());
    const cryptoCoinsBoxName = 'cryptoCoinsBox';
    final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

    // Инициализация Firebase
    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    talker.info(app.options.projectId);

    // Инициализация Dio и Bloc
    final dio = Dio();
    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printStateFullData: false,
        printEventFullData: false,
      ),
    );
    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        ),
      ),
    );

    // Регистрация репозитория
    GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox),
    );

    // Обработка ошибок Flutter
    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

    // Запуск приложения
    runApp(const CryptoCurrenciesListApp());
  }, (error, stack) => GetIt.I<Talker>().handle(error, stack));
}
