import 'package:ecom_clean_code/features/profile/data/model/profile_data_model.dart';
import 'package:ecom_clean_code/features/profile/domain/entity/profile_entity.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileDomainMapper {
  @factoryMethod
  ProfileEntity fromProfileModel(ProfileDataModel model);
  @factoryMethod
  Address fromAddressModel(AddressDataModel model);
  @factoryMethod
  Geolocation fromGeolocationModel(GeolocationDataModel model);
  @factoryMethod
  Name fromNameModel(NameModel model);
}

@LazySingleton(as: ProfileDomainMapper)
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
