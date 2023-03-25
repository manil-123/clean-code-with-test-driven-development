import 'package:json_annotation/json_annotation.dart';

part 'profile_data_model.g.dart';

@JsonSerializable()
class ProfileDataModel {
  final AddressDataModel? address;
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final NameModel? name;
  final String? phone;
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
class AddressDataModel {
  final GeolocationDataModel? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  AddressDataModel(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});

  factory AddressDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataModelToJson(this);
}

@JsonSerializable()
class GeolocationDataModel {
  final String? lat;
  final String? long;

  GeolocationDataModel({this.lat, this.long});

  factory GeolocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$GeolocationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeolocationDataModelToJson(this);
}

@JsonSerializable()
class NameModel {
  final String? firstname;
  final String? lastname;

  NameModel({this.firstname, this.lastname});

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      _$NameModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameModelToJson(this);
}
