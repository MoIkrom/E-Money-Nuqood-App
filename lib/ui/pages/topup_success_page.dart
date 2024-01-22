import "package:flutter/material.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";

class TopupSuccessPage extends StatelessWidget {
  const TopupSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Top Up Success ! ",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                'Use the money wisely and\ngrow your finance',
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomFilledButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
                width: 183,
                title: "Back to Home",
              )
            ],
          ),
        ));
  }
}
