import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';

class PackageItem extends StatelessWidget {
  final int amount;
  final int price;
  final bool isSelected;

  const PackageItem(
      {Key? key,
      required this.amount,
      required this.price,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 173,
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      margin: EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: whiteColor,
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            '${amount}GB',
            style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: bold,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp',
              decimalDigits: 0,
            ).format(price),
            style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
