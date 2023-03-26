// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_domain_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ProfileDomainMapperImpl extends ProfileDomainMapper {
  ProfileDomainMapperImpl() : super();

  @override
  ProfileEntity fromProfileModel(ProfileDataModel model) {
    final profileentity = ProfileEntity(
      address: model.address == null ? null : fromAddressModel(model.address!),
      id: model.id,
      email: model.email,
      username: model.username,
      password: model.password,
      name: model.name == null ? null : fromNameModel(model.name!),
      phone: model.phone,
      iV: model.iV,
    );
    return profileentity;
  }

  @override
  Address fromAddressModel(AddressDataModel model) {
    final address = Address(
      geolocation: model.geolocation == null
          ? null
          : fromGeolocationModel(model.geolocation!),
      city: model.city,
      street: model.street,
      number: model.number,
      zipcode: model.zipcode,
    );
    return address;
  }

  @override
  Geolocation fromGeolocationModel(GeolocationDataModel model) {
    final geolocation = Geolocation(
      lat: model.lat,
      long: model.long,
    );
    return geolocation;
  }

  @override
  Name fromNameModel(NameModel model) {
    final name = Name(
      firstname: model.firstname,
      lastname: model.lastname,
    );
    return name;
  }
}
