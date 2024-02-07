import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:nuqood/blocs/auth/auth_bloc.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import "package:nuqood/ui/widgets/forms.dart";

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  title: "Username",
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: "Full Name",
                  controller:  nameController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: "Email Address",
                  controller:  emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: "Password",
                  obscureText: true,
                  controller:  passwordController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: "Update Now",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/profile-edit-success', (route) => false);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
