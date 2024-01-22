import "package:flutter/material.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import "package:nuqood/ui/widgets/forms.dart";
import "package:nuqood/ui/widgets/package_item.dart";

class DataPackage extends StatelessWidget {
  const DataPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Phone Number",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: "+628",
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Select Package",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              const PackageItem(
                amount: 10,
                price: 100000,
                isSelected: true,
              ),
              const PackageItem(amount: 20, price: 200000),
              const PackageItem(amount: 30, price: 300000),
              const PackageItem(amount: 40, price: 400000),
            ],
          ),
          const SizedBox(
            height: 85,
          ),
          CustomFilledButton(
            title: "Continue",
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                await Navigator.pushNamed(context, '/data-package-success');
              }
            },
          )
        ],
      ),
    );
  }
}
