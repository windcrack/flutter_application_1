import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/router.dart';
import 'package:flutter_application_1/theme/theme.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: routes,
      // home: const CryptoListScreen(),
    );
  }
}