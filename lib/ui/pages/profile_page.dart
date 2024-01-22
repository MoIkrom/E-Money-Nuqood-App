import "package:flutter/material.dart";
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 20,
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
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/ikram.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
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
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Muhammad Ikram',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  title: 'Edit Profile',
                  iconUrl: 'assets/ic_edit_profile.png',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      Navigator.pushNamed(context, '/profile-edit');
                    }
                    ;
                  },
                ),
                ProfileMenuItem(
                  title: 'My PIN',
                  iconUrl: 'assets/ic_pin.png',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: 87,
          ),
          CustomtextButton(
            title: 'Report a Problem',
            onPressed: () {},
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
