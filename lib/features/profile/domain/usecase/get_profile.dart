import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/profile/domain/entity/profile_entity.dart';
import 'package:ecom_clean_code/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

// @lazySingleton
class GetProfile extends Usecase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetProfile(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    return await profileRepository.fetchProfile();
  }
}
