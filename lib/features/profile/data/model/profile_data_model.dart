import 'package:ecom_clean_code/core/constants/hive_config.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_data_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.profileDataModel)
class ProfileDataModel {
  @HiveField(0)
  final AddressDataModel? address;
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? username;
  @HiveField(4)
  final String? password;
  @HiveField(5)
  final NameModel? name;
  @HiveField(6)
  final String? phone;
  @HiveField(7)
  final int? iV;

  ProfileDataModel(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});
  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.profileAddressDataModel)
class AddressDataModel {
  @HiveField(0)
  final GeolocationDataModel? geolocation;
  @HiveField(1)
  final String? city;
  @HiveField(2)
  final String? street;
  @HiveField(3)
  final int? number;
  @HiveField(4)
  final String? zipcode;

  AddressDataModel(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});

  factory AddressDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.profileAddressGeolocationDataModel)
class GeolocationDataModel {
  @HiveField(0)
  final String? lat;
  @HiveField(1)
  final String? long;

  GeolocationDataModel({this.lat, this.long});

  factory GeolocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$GeolocationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeolocationDataModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.profileNameDataModel)
class NameModel {
  @HiveField(0)
  final String? firstname;
  @HiveField(1)
  final String? lastname;

  NameModel({this.firstname, this.lastname});

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      _$NameModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameModelToJson(this);
}
