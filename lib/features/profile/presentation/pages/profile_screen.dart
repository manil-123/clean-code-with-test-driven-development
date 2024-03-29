import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/constants/routes.dart';
import 'package:ecom_clean_code/core/widgets/custom_circular_progress_indicator.dart';
import 'package:ecom_clean_code/core/widgets/faded_horizontal_line.dart';
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart';
import 'package:ecom_clean_code/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecom_clean_code/features/profile/presentation/widgets/profile_item.dart';
import 'package:ecom_clean_code/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
        child: ProfileContentScreen());
  }
}

class ProfileContentScreen extends StatefulWidget {
  const ProfileContentScreen({super.key});

  @override
  State<ProfileContentScreen> createState() => _ProfileContentScreenState();
}

class _ProfileContentScreenState extends State<ProfileContentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstant.appName,
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return CustomCircularProgressIndicator();
          } else if (state is ProfileFailed) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is ProfileLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileImage(),
                SizedBox(
                  height: 60.0,
                ),
                Center(
                  child: Text(
                    state.profileEntity.name!.firstname! +
                        state.profileEntity.name!.lastname!,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Center(
                  child: Text(
                    state.profileEntity.email ?? '',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Center(
                  child: Text(
                    '${state.profileEntity.address!.street}, ${state.profileEntity.address!.city}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                const FadedHorizontalLine(),
                const SizedBox(
                  height: 6.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileItem(
                        iconData: Icons.person_outline,
                        title: StringConstant.editProfileText,
                        navigateTo: () {},
                      ),
                      ProfileItem(
                        iconData: Icons.lock_open,
                        title: StringConstant.changePasswordText,
                        navigateTo: () {},
                      ),
                      ProfileItem(
                          iconData: Icons.logout,
                          title: StringConstant.logoutText,
                          navigateTo: () {
                            context.read<LoginCubit>().logOut();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                Routes.loginPageRoute, (route) => false);
                          }),
                    ],
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget _profileImage() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: 45,
        child: Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl:
                    'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
