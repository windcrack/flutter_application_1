import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/cryptoCoin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'crypto_coin_details_state.dart';
part 'crypto_coin_details_event.dart';

class CrytpoCoinBloc extends Bloc<CrytpoCoinEvent, CrytpoCoinState> {
  CrytpoCoinBloc(this.coinsRepository) : super(CrytpoCoinInitial()) {
    on<LoadingCryptoCoin>((event, emit) async {
      // print(event.currencyCode);
      final cryptoCoinsDetail = await GetIt.I<AbstractCoinsRepository>().getCoinDetails(event.currencyCode);
      emit(CryptoCoinLoaded(coin: cryptoCoinsDetail));
    });
  }

  final AbstractCoinsRepository coinsRepository;
}