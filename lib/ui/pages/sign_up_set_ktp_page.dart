import "package:flutter/material.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";

class SignUpSetKtpPage extends StatelessWidget {
  const SignUpSetKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
            "Verify Your\nAccount",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: lightBackgroundColor),
                  child: Center(
                    child: Image.asset(
                      'assets/ic_upload.png',
                      width: 32,
                    ),
                  ),
                ),
                // Container(
                //   width: 120,
                //   height: 120,
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           fit: BoxFit.contain,
                //           image:
                //               AssetImage('assets/img_provider_telkomsel.png'))),
                // ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Passport / ID Card",
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomFilledButton(
                  title: "Continue",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomtextButton(
            title: "Skip For Now",
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up-success');
            },
          ),
        ],
      ),
    );
  }
}
