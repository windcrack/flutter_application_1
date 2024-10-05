import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cryptoList/bloc/crypto_list_bloc.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/cryptoCoin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key,});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  final _cryptoListBlock = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    // _lodalCryptoCoins();
    _cryptoListBlock.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TalkerScreen(talker: GetIt.I<Talker>())));
            }, 
            icon: const Icon(Icons.document_scanner_outlined)
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBlock.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBlock,
          builder: (context, state) {
            if(state is CryptoListLoaded){
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  final coin = state.coinsList[i];
                  return CryptoCoinTile(coin: coin);
                }
              );
            }
            if(state is CryptoListLoadingFailure){
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Что-то пошло не так.'),
                  const Text('Попробуйте позже'),
                  const SizedBox(height: 30),
                  TextButton(onPressed: () {
                    _cryptoListBlock.add(LoadCryptoList());
                  }, child: const Text('Попробовать снова')),
                ],
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      
      // _cryptoCoinsList == null 
      // ? const Center(child: CircularProgressIndicator())  
      // : ListView.separated(
      //   padding: EdgeInsets.only(top: 16),
      //   itemCount: _cryptoCoinsList!.length,
      //   separatorBuilder: (context, index) => Divider(),
      //   itemBuilder: (context, i) {
      //     final coin = _cryptoCoinsList![i];
      //     return CryptoCoinTile(coin: coin);
      //   }
      // ),
    );
  }
}

