part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoin> coinsList;

  CryptoListLoaded({required this.coinsList});
  
  @override
  // TODO: implement props
  List<Object?> get props => coinsList;
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({required this.exception});

  final Object? exception;
  
  @override
  // TODO: implement props
  List<Object?> get props => [exception];

}