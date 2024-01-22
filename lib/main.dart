import 'package:flutter/material.dart';
import 'package:nuqood/blocs/auth/auth_bloc.dart';
import 'package:nuqood/shared/theme.dart';
import 'package:nuqood/ui/pages/data_package_page.dart';
import 'package:nuqood/ui/pages/data_provider_page.dart';
import 'package:nuqood/ui/pages/loading_page.dart';
import 'package:nuqood/ui/pages/onBoarding_page.dart';
import 'package:nuqood/ui/pages/package_success_page.dart';
import 'package:nuqood/ui/pages/pin-page.dart';
import 'package:nuqood/ui/pages/profile_edit_page.dart';
import 'package:nuqood/ui/pages/profile_edit_pin_page.dart';
import 'package:nuqood/ui/pages/profile_edit_success_page.dart';
import 'package:nuqood/ui/pages/profile_page.dart';
import 'package:nuqood/ui/pages/sign_in_page.dart';
import 'package:nuqood/ui/pages/splash_page.dart';
import 'package:nuqood/ui/pages/topup_amount_page.dart';
import 'package:nuqood/ui/pages/topup_page.dart';
import 'package:nuqood/ui/pages/topup_success_page.dart';
import 'package:nuqood/ui/pages/transfer_amount_page.dart';
import 'package:nuqood/ui/pages/transfer_page.dart';
import 'package:nuqood/ui/pages/transfer_success_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/pages/home_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/sign_up_set_ktp_page.dart';
import 'ui/pages/sign_up_success_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: lightBackgroundColor,
            appBarTheme: AppBarTheme(
              backgroundColor: lightBackgroundColor,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: blackColor,
              ),
              titleTextStyle: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            )),
        routes: {
          '/': (context) => const splashPage(),
          '/onboarding': (context) => const onBoardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/pin': (context) => const PinPage(),
          '/topup': (context) => const TopupPage(),
          '/topup-amount': (context) => const TopupAmountPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/loading-page': (context) => const LoadingPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackage(),
          '/data-package-success': (context) => const PackageSuccessPage(),
        },
      ),
    );
  }
}