import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  final String name;
  final double priceInUSD;
  final String image;
  final double hight24hour;
  final double low24hour;

  CryptoCoin({
    required this.name, 
    required this.priceInUSD, 
    required this.image, 
    required this.hight24hour,
    required this.low24hour,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, priceInUSD, image, hight24hour];
}