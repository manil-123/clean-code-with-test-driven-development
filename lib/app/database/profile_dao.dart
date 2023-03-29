import 'package:ecom_clean_code/core/constants/hive_config.dart';
import 'package:ecom_clean_code/features/profile/data/model/profile_data_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProfileDao {
  static const int _profileInfoKey = 0;
  final Future<Box<ProfileDataModel>> _profileBox =
      Hive.openBox(HiveBoxNames.profileInfo);

  Future<void> insertProfileInfo(ProfileDataModel profileDataModel) async {
    final box = await _profileBox;
    box.put(_profileInfoKey, profileDataModel);
  }
}
