import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cryptoCoin/bloc/crypto_coin_details/crypto_coin_details_bloc.dart';
import 'package:flutter_application_1/features/cryptoCoin/widgets/cryptoBaseCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/cryptoCoins/abstractCoinsRepository.dart';

class CruptoCoinScreen extends StatefulWidget {
  const CruptoCoinScreen({super.key});

  @override
  State<CruptoCoinScreen> createState() => _CruptoCoinScreenState();
}

class _CruptoCoinScreenState extends State<CruptoCoinScreen> {

  String? coinName;

  final coinDetailBloc = CrytpoCoinBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provider String args');
    // if(args == null){
    //   print('You must provider args');
    //   return;
    // }
    // if(args is! String){
    //   print('You must provider String args');
    //   return;
    // }
    coinName = args as String;
    setState(() {
      coinDetailBloc.add(LoadingCryptoCoin(currencyCode: coinName!));
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CrytpoCoinBloc, CrytpoCoinState>(
        bloc: coinDetailBloc,
        builder: (context, state) {
          if(state is CryptoCoinLoaded){
            final coin = state.coin;
            final coinImg = coin.image;
            final coinPrice = coin.priceInUSD;
            final hight24hour = coin.hight24hour;
            final low24hour = coin.low24hour;
            return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(coinImg),
                ),
                const SizedBox(height: 24),
                Text(
                  coin.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text('Цена на данный момент:'),
                CrytptoBaseCard(
                  child: Center(
                    child: Text(
                      '${coinPrice.toStringAsFixed(2)} \$',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                  )
                ),
                const SizedBox(height: 12),
                Text('Цена за 24:'),
                CrytptoBaseCard(
                    child: Column(
                      children: [
                        DataRow(title: 'Высокая', value: '${hight24hour.toStringAsFixed(2)} \$'),
                        DataRow(title: 'Низкая', value: '${low24hour.toStringAsFixed(2)} \$'),
                      ],
                  )
                )
              ],
            ),
          );
          }
          return const Center(child: CircularProgressIndicator());
        }),
    );
  }
}

class DataRow extends StatelessWidget {
  const DataRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        )
      ],
    );
  }
}