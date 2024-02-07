import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:nuqood/blocs/auth/auth_bloc.dart";
import "package:nuqood/models/sign_in_fom.dart";
import "package:nuqood/shared/shared_methods.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import "../widgets/forms.dart";

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final RegExp emailRegExp =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  String errorMessage = '';

  bool validate() {
    String email = emailController.text.trim();

    if (emailController.text.isEmpty) {
      errorMessage = 'Email Cannot be Empty!';

      return false;
    } else if (!emailRegExp.hasMatch(email)) {
      errorMessage = 'Invalid email format';
      return false;
    }
    if (passwordController.text.isEmpty) {
      errorMessage = 'Password Cannot be Empty!';
      return false;
    }
    if (passwordController.text.length < 6) {
      errorMessage = 'Password atleast 6 character';

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
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
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
            padding: REdgeInsets.symmetric(
              horizontal: 34,
            ),
            children: [
              Container(
                width: 155.w,
                height: 50.h,
                margin: EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img_logo_light.png'))),
              ),
              Text(
                "Sign In &\nGrow Your Finance",
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
              ),
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
                    // Email input
                    CustomFormField(
                      title: "Email Address",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    // Password input
                    CustomFormField(
                      title: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password",
                        style: blueTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomFilledButton(
                      title: "Sign In",
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                Authlogin(
                                  SignInFormModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackBar(
                            context,
                            errorMessage,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomtextButton(
                title: "Create New Account",
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
