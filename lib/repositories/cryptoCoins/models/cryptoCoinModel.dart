import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  final String name;
  final double priceInUSD;
  final String image;

  CryptoCoin({required this.name, required this.priceInUSD, required this.image});
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, priceInUSD, image];
}