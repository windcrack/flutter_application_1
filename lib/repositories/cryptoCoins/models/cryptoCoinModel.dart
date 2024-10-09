import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/cryptoCoins/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';


part 'cryptoCoinModel.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable{
  const CryptoCoin({
    required this.name,
    required this.details,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinModelDetails details;

  @override
  // TODO: implement props
  List<Object?> get props => [name, details];
}