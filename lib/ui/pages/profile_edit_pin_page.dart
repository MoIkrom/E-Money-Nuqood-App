import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nuqood/blocs/auth/auth_bloc.dart";
import "package:nuqood/shared/shared_methods.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import "package:nuqood/ui/widgets/forms.dart";

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
  final pinController = TextEditingController(text: '');
  String errorMessage = '';

  bool validate() {
    if (pinController.text.length != 6) {
      errorMessage = 'PIN minimum 6 digit Number !';
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit PIN",
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            print(state.e);
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
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
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: "Old PIN",
                      controller: oldPinController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomFormField(
                      title: "New PIN ",
                      controller: newPinController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomFilledButton(
                      title: "Update Now",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              UpdatePin(
                                  oldPinController.text, newPinController.text),
                            );
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
