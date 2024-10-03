part of 'crypto_coin_details_bloc.dart';

abstract class CrytpoCoinState extends Equatable{}

class CrytpoCoinInitial extends CrytpoCoinState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CrytpoCoinState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CrytpoCoinState {
  final CryptoCoin coin;

  CryptoCoinLoaded({required this.coin});
  
  @override
  // TODO: implement props
  List<Object?> get props => [coin];
}

class CryptoCoinLoadingFailure extends CrytpoCoinState{
  CryptoCoinLoadingFailure({required this.exections});

  final Object exections;

  @override
  // TODO: implement props
  List<Object?> get props => [exections];

}