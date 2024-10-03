part of 'crypto_coin_details_bloc.dart';

abstract class CrytpoCoinEvent  extends Equatable{
  
}

class LoadingCryptoCoin extends CrytpoCoinEvent {
  LoadingCryptoCoin({required this.currencyCode});

  final String currencyCode;
  @override
  // TODO: implement props
  List<Object?> get props => [currencyCode];

}