import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cryptoCoinsListApp.dart';
import 'package:get_it/get_it.dart';

import 'repositories/cryptoCoins/cryptoCoin.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCurrenciesListApp());
}

