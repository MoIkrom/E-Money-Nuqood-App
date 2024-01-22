import 'package:flutter/material.dart';
import 'package:nuqood/shared/theme.dart';

class CardListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final bool isSelected;

  const CardListItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : whiteColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                subTitle,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
