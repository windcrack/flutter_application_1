import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cryptoCoinModelDetails.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinModelDetails extends Equatable {
   CryptoCoinModelDetails(
      {
        required this.priceInUSD,
        required this.image,
        required this.hight24hour,
        required this.low24hour
      });
  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String image;

  @HiveField(2)
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24hour;

  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR')
  final double low24hour;

  String get fullImageUrl => 'https://www.cryptocompare.com/$image';

  factory CryptoCoinModelDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinModelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinModelDetailsToJson(this);
  
  @override
  // TODO: implement props
  List<Object?> get props => [priceInUSD, image, hight24hour, low24hour];
}