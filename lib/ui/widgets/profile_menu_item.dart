import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String iconUrl;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.iconUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
