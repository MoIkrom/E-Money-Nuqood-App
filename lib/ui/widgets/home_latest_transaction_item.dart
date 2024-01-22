import 'package:flutter/material.dart';
import 'package:nuqood/shared/theme.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String time;
  final String value;

  const HomeLatestTransactionItem({
    Key? key,
    required this.title,
    required this.iconUrl,
    required this.time,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                ),
                Text(
                  time,
                  style: greyTextStyle.copyWith(fontWeight: bold),
                )
              ],
            ),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          )
        ],
      ),
    );
  }
}
