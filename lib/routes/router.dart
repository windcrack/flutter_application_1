import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cryptoCoin/cryptoCoin.dart';
import 'package:flutter_application_1/features/cryptoList/crypto_list.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/cryptoCoin.dart';

part 'router.gr.dart';

// final routes = {
//   '/' : (context) => const CryptoListScreen(),
//   '/coin' : (context) => const CruptoCoinScreen(),
// };

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoListRoute.page, path: '/'),
    AutoRoute(page: CruptoCoinRoute.page),
  ];
}
            
// extend the generated private router        
// class AppRouter extends _$AppRouter{}    