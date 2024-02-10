import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nuqood/blocs/auth/auth_bloc.dart";
import "package:nuqood/shared/shared_methods.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import "package:nuqood/ui/widgets/profile_menu_item.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture!.isEmpty
                                ? const AssetImage(
                                    'assets/user-picture.png',
                                  )
                                : NetworkImage(state.user.profilePicture!)
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: greenColor,
                                    size: 24,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        state.user.name!.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ProfileMenuItem(
                        title: 'Edit Profile',
                        iconUrl: 'assets/ic_edit_profile.png',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit');
                          }
                          ;
                        },
                      ),
                      ProfileMenuItem(
                        title: 'My PIN',
                        iconUrl: 'assets/ic_pin.png',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit-pin');
                          }
                          ;
                        },
                      ),
                      ProfileMenuItem(
                        title: 'Wallet Settings',
                        iconUrl: 'assets/ic_wallet.png',
                      ),
                      ProfileMenuItem(
                        title: 'My Rewards',
                        iconUrl: 'assets/ic_my_rewards.png',
                      ),
                      ProfileMenuItem(
                        title: 'Help Center',
                        iconUrl: 'assets/ic_help.png',
                      ),
                      ProfileMenuItem(
                        title: 'Log Out',
                        iconUrl: 'assets/ic_logout.png',
                        onTap: () {
                          context.read<AuthBloc>().add(
                                AuthLogout(),
                              );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 87.h,
                ),
                CustomtextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
