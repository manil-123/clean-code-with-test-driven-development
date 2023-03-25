import 'package:ecom_clean_code/features/profile/data/model/profile_data_model.dart';
import 'package:ecom_clean_code/features/profile/domain/entity/profile_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:smartstruct/smartstruct.dart';

part 'profile_domain_mapper.mapper.g.dart';

@Mapper()
@injectable
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
