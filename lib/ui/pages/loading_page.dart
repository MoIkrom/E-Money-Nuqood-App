import "package:flutter/material.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading . . . ",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 26,
          ),
          CustomFilledButton(
            title: "Back to Home",
            width: 200,
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          )
        ],
      ),
    ));
  }
}
