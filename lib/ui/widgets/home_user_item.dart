import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final String username;
  final String imageUrl;

  const HomeUserItem({
    Key? key,
    required this.username,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 120,
          margin: EdgeInsets.only(right: 17),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: whiteColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(bottom: 13),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      imageUrl,
                    ),
                  ),
                ),
              ),
              Text(
                '@$username',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
