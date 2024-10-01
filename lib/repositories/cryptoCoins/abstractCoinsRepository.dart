import 'package:flutter_application_1/repositories/cryptoCoins/models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}