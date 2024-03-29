import 'package:ecom_clean_code/core/data/error_handler.dart';
import 'package:ecom_clean_code/features/profile/data/datasource/profile_local_data_source.dart';
import 'package:ecom_clean_code/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:ecom_clean_code/features/profile/data/mapper/profile_domain_mapper.dart';
import 'package:ecom_clean_code/features/profile/domain/entity/profile_entity.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;
  final ProfileDomainMapper profileDomainMapper;
  final ErrorHandler errorHandler;

  ProfileRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.profileDomainMapper,
    this.errorHandler,
  );

  @override
  Future<Either<Failure, ProfileEntity>> fetchProfile() async {
    final localProfileInfo = await localDataSource.fetchProfile();
    if (localProfileInfo != null) {
      final profileEntity =
          profileDomainMapper.fromProfileModel(localProfileInfo);
      return await errorHandler.handleError<ProfileEntity>(profileEntity);
    } else {
      final response = await remoteDataSource.fetchProfile();
      final profileEntity = profileDomainMapper.fromProfileModel(response);
      return await errorHandler.handleError<ProfileEntity>(profileEntity);
    }
  }
}
