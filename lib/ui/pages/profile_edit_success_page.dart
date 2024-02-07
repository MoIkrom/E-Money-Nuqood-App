import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";

class ProfileEditSuccessPage extends StatelessWidget {
  const ProfileEditSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nice Update ! ",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            'Your Data is safe with\nOur system',
            style: greyTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomFilledButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/home", (route) => false);
            },
            width: 183.w,
            title: "Back to Home",
          )
        ],
      ),
    ));
  }
}
