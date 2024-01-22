import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class HomeServicesItem extends StatelessWidget {
  final String title;
  final String iconUrl;
  final bool isDisable;
  final VoidCallback? onTap;

  const HomeServicesItem({
    Key? key,
    required this.title,
    required this.iconUrl,
    this.isDisable = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Center(
                child: Image.asset(
              iconUrl,
              width: 26,
            )),
          ),
          Text(
            title,
            style: isDisable
                ? greyTextStyle.copyWith(fontWeight: bold)
                : blackTextStyle.copyWith(fontWeight: bold),
          )
        ],
      ),
    );
  }
}
