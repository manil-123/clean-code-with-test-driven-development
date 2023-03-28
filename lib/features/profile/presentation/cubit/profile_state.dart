part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileEntity profileEntity;

  const ProfileLoaded(this.profileEntity);

  @override
  List<Object> get props => [profileEntity];
}

class ProfileFailed extends ProfileState {
  final String errorMessage;

  const ProfileFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
