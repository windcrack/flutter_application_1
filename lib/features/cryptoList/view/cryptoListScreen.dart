import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/cryptoCoinsRepository.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/models/cryptoCoinModel.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key,});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _lodalCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
      ),
      body: _cryptoCoinsList == null 
      ? const Center(child: CircularProgressIndicator())  
      : ListView.separated(
        padding: EdgeInsets.only(top: 16),
        itemCount: _cryptoCoinsList!.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          final coin = _cryptoCoinsList![i];
          return CryptoCoinTile(coin: coin);
        }
      ),
    );
  }

  Future<void> _lodalCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}

