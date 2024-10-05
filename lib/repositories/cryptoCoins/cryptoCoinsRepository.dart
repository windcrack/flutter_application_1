import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/cryptoCoin.dart';


const String url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD,JPY,EUR';
class CryptoCoinsRepository implements AbstractCoinsRepository {

  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    cryptoCoinsList = await fetchingApi();
    return cryptoCoinsList;
  }


  @override
  Future<List<CryptoCoin>> fetchingApi() async {
  final response = await dio.get(url);
    final data =  response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e){
      final usdData = (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final image = usdData['IMAGEURL'];
      final hight24hour = usdData['HIGH24HOUR'];
      final low24hour = usdData["LOW24HOUR"];
      return CryptoCoin(
        name: e.key, 
        priceInUSD: price,
        image: 'https://www.cryptocompare.com/$image',
        hight24hour: hight24hour,
        low24hour: low24hour,
      );}).toList();
    return cryptoCoinsList;
  }
  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async{
    final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data =  response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataCoin = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = dataCoin['USD'] as Map<String, dynamic>;
    final name = usdData['FROMSYMBOL'];
    final price = usdData['PRICE'];
    final image = usdData['IMAGEURL'];
    final hight24hour = usdData['HIGH24HOUR'];
    final low24hour = usdData["LOW24HOUR"];
    return CryptoCoin(
        name: name,
        priceInUSD: price,
        image: 'https://www.cryptocompare.com/$image',
        hight24hour: hight24hour,
        low24hour: low24hour,
    );
  }
}