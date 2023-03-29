// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileDataModelAdapter extends TypeAdapter<ProfileDataModel> {
  @override
  final int typeId = 0;

  @override
  ProfileDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileDataModel(
      address: fields[0] as AddressDataModel?,
      id: fields[1] as int?,
      email: fields[2] as String?,
      username: fields[3] as String?,
      password: fields[4] as String?,
      name: fields[5] as NameModel?,
      phone: fields[6] as String?,
      iV: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileDataModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.iV);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressDataModelAdapter extends TypeAdapter<AddressDataModel> {
  @override
  final int typeId = 1;

  @override
  AddressDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressDataModel(
      geolocation: fields[0] as GeolocationDataModel?,
      city: fields[1] as String?,
      street: fields[2] as String?,
      number: fields[3] as int?,
      zipcode: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressDataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.geolocation)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.street)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.zipcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GeolocationDataModelAdapter extends TypeAdapter<GeolocationDataModel> {
  @override
  final int typeId = 2;

  @override
  GeolocationDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeolocationDataModel(
      lat: fields[0] as String?,
      long: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GeolocationDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeolocationDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NameModelAdapter extends TypeAdapter<NameModel> {
  @override
  final int typeId = 3;

  @override
  NameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NameModel(
      firstname: fields[0] as String?,
      lastname: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NameModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.firstname)
      ..writeByte(1)
      ..write(obj.lastname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      address: json['address'] == null
          ? null
          : AddressDataModel.fromJson(json['address'] as Map<String, dynamic>),
      id: json['id'] as int?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] == null
          ? null
          : NameModel.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'iV': instance.iV,
    };

AddressDataModel _$AddressDataModelFromJson(Map<String, dynamic> json) =>
    AddressDataModel(
      geolocation: json['geolocation'] == null
          ? null
          : GeolocationDataModel.fromJson(
              json['geolocation'] as Map<String, dynamic>),
      city: json['city'] as String?,
      street: json['street'] as String?,
      number: json['number'] as int?,
      zipcode: json['zipcode'] as String?,
    );

Map<String, dynamic> _$AddressDataModelToJson(AddressDataModel instance) =>
    <String, dynamic>{
      'geolocation': instance.geolocation,
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
    };

GeolocationDataModel _$GeolocationDataModelFromJson(
        Map<String, dynamic> json) =>
    GeolocationDataModel(
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$GeolocationDataModelToJson(
        GeolocationDataModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

NameModel _$NameModelFromJson(Map<String, dynamic> json) => NameModel(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$NameModelToJson(NameModel instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
