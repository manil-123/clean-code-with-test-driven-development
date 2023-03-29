import 'package:ecom_clean_code/app/database/profile_dao.dart';
import 'package:ecom_clean_code/features/profile/data/model/profile_data_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProfileLocalDataSource {
  final ProfileDao profileDao;

  ProfileLocalDataSource(this.profileDao);

  Future<ProfileDataModel?> fetchProfile() async {
    return await profileDao.getProfileInfo();
  }
}
