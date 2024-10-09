// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptoCoinModelDetails.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinModelDetailsAdapter
    extends TypeAdapter<CryptoCoinModelDetails> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinModelDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinModelDetails(
      priceInUSD: fields[0] as double,
      image: fields[1] as String,
      hight24hour: fields[2] as double,
      low24hour: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinModelDetails obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.priceInUSD)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.hight24hour)
      ..writeByte(3)
      ..write(obj.low24hour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinModelDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
