import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/models/models.dart';
import 'package:json_annotation/json_annotation.dart';


// part 'cryptoCoinModel.g.dart';

@JsonSerializable()
class CryptoCoin extends Equatable{
  const CryptoCoin({
    required this.name,
    required this.details,
  });
  
  final String name;

  final CryptoCoinModelDetails details;

  @override
  // TODO: implement props
  List<Object?> get props => [name, details];
}