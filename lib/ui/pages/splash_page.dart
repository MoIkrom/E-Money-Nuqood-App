import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nuqood/shared/theme.dart';

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, "/onboarding", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
          child: Container(
        width: 155,
        height: 50,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/img_logo_dark.png'))),
      )),
    );
  }
}
