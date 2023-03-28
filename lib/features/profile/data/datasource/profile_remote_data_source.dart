import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart';
import 'package:ecom_clean_code/core/data/json_decoder.dart';
import 'package:ecom_clean_code/features/profile/data/model/profile_data_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProfileRemoteDataSource extends BaseRemoteDataSourceImpl {
  ProfileRemoteDataSource(super.client, super.sharedPreferences);

  Future<ProfileDataModel> fetchProfile() async {
    final response = await performGetRequest(ApiEndpoints.profileUrl);
    final data = jsonDecodeAndHandleException(response);
    return ProfileDataModel.fromJson(data);
  }
}
