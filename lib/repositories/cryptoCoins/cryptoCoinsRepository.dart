import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/cryptoCoin.dart';


const String url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD,JPY,EUR';
class CryptoCoinsRepository implements AbstractCoinsRepository {

  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(url);
    final data =  response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e){
      final usdData = (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final image = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key, 
        priceInUSD: price,
        image: 'https://www.cryptocompare.com/${image}',
      );}).toList();
    return cryptoCoinsList;
  }
}