import "package:flutter/material.dart";
import "package:nuqood/blocs/auth/auth_bloc.dart";
import "package:nuqood/models/sign_up_form_model.dart";
import "package:nuqood/shared/shared_methods.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/pages/sign_up_set_profile_page.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import "../widgets/forms.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }
          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpSetProfilePage(
                    data: SignUpFormModel(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ),
                ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 34,
            ),
            children: [
              Container(
                width: 155,
                height: 50,
                margin: EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img_logo_light.png'))),
              ),
              Text(
                "Join Us to Unlock\nYour Growth",
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email input
                    CustomFormField(
                      title: "Full Name",
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: "Email Address",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Password input
                    CustomFormField(
                      title: "Password",
                      controller: passwordController,
                      obscureText: true,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailController.text));
                        } else {
                          showCustomSnackBar(
                            context,
                            "All Field Must be Filled",
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomtextButton(
                title: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}
