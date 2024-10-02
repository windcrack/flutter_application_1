import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/cryptoCoin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if(state is! CryptoListLoaded){
          emit(CryptoListLoading());
        }
        
        final cryptoList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: cryptoList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      }finally{
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
} 