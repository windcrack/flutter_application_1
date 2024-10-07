import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cryptoCoinModelDetails.g.dart';

@JsonSerializable()
class CryptoCoinModelDetails extends Equatable {
   CryptoCoinModelDetails(
      {
        required this.priceInUSD,
        required this.image,
        required this.hight24hour,
        required this.low24hour
      });
  
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @JsonKey(name: 'IMAGEURL')
  final String image;

  String get fullImageUrl => 'https://www.cryptocompare.com/$image';

  @JsonKey(name: 'HIGH24HOUR')
  final double hight24hour;

  @JsonKey(name: 'LOW24HOUR')
  final double low24hour;

  factory CryptoCoinModelDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinModelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinModelDetailsToJson(this);
  
  @override
  // TODO: implement props
  List<Object?> get props => [priceInUSD, image, hight24hour, low24hour];
}