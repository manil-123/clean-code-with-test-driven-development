// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDataModelAdapter extends TypeAdapter<ProductDataModel> {
  @override
  final int typeId = 4;

  @override
  ProductDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDataModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[2] as num?,
      description: fields[3] as String?,
      category: fields[4] as String?,
      image: fields[5] as String?,
      rating: fields[6] as RatingDataModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RatingDataModelAdapter extends TypeAdapter<RatingDataModel> {
  @override
  final int typeId = 5;

  @override
  RatingDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingDataModel(
      rate: fields[0] as num?,
      count: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RatingDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDataModel _$ProductDataModelFromJson(Map<String, dynamic> json) =>
    ProductDataModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as num?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingDataModel.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataModelToJson(ProductDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };

RatingDataModel _$RatingDataModelFromJson(Map<String, dynamic> json) =>
    RatingDataModel(
      rate: json['rate'] as num?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$RatingDataModelToJson(RatingDataModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
