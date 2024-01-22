import "dart:io";

import "package:flutter/material.dart";
import "package:nuqood/models/sign_up_form_model.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import "package:nuqood/ui/widgets/forms.dart";
import 'package:image_picker/image_picker.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfilePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

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
            "Join Us to Unlock\nYour Growth",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await selectedImage;
                    setState(() {
                      selectedImage = image;
                    });
                    print("oii belum bisa di tekan nich !");
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.contain,
                              image: FileImage(
                                File(selectedImage!.path),
                              ),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                              'assets/ic_upload.png',
                              width: 32,
                            ),
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
                  "Muhammad Ikram",
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  title: "Set PIN (6 Digit Number)",
                  obscureText: true,
                  controller: pinController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: "Continue",
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-set-ktp');
                  },
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
        ],
      ),
    );
  }
}
