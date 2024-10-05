import 'package:flutter_application_1/features/cryptoCoin/cryptoCoin.dart';
import 'package:flutter_application_1/features/cryptoList/crypto_list.dart';

final routes = {
  '/' : (context) => const CryptoListScreen(),
  '/coin' : (context) => const CruptoCoinScreen(),
};