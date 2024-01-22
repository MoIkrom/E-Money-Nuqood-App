import "package:flutter/material.dart";
import "package:nuqood/shared/theme.dart";
import 'package:nuqood/ui/widgets/card_list_item.dart';
import "package:nuqood/ui/widgets/buttons.dart";

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Top Up",
      )),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "081919188291",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Muhammad Ikram",
                    style: greyTextStyle,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CardListItem(
            title: "Bank BCA",
            subTitle: "50 Mins",
            imageUrl: "assets/img_bank_bca.png",
            isSelected: true,
          ),
          const CardListItem(
            title: "Bank BNI",
            subTitle: "50 Mins",
            imageUrl: "assets/img_bank_bni.png",
          ),
          const CardListItem(
            title: "Bank Mandiri",
            subTitle: "50 Mins",
            imageUrl: "assets/img_bank_mandiri.png",
          ),
          const CardListItem(
            title: "Bank OCBC",
            subTitle: "50 Mins",
            imageUrl: "assets/img_bank_ocbc.png",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: "Continue",
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
