// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptoCoinModelDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinModelDetails _$CryptoCoinModelDetailsFromJson(
        Map<String, dynamic> json) =>
    CryptoCoinModelDetails(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      image: json['IMAGEURL'] as String,
      hight24hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24hour: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinModelDetailsToJson(
        CryptoCoinModelDetails instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.image,
      'HIGH24HOUR': instance.hight24hour,
      'LOW24HOUR': instance.low24hour,
    };
