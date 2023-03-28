import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/profile/domain/usecase/get_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_clean_code/features/profile/domain/entity/profile_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile usecase;
  ProfileCubit(this.usecase)
      : super(
          ProfileInitial(),
        );

  void fetchProfile() async {
    emit(
      ProfileLoading(),
    );
    final response = await usecase.call(
      NoParams(),
    );

    response.fold(
      (failure) {
        emit(
          ProfileFailed(failure.failureMessage),
        );
      },
      (profileEntity) {
        emit(
          ProfileLoaded(profileEntity),
        );
      },
    );
  }
}
