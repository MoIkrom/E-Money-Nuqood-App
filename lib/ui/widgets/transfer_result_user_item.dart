import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class TransferResultUserItem extends StatelessWidget {
  final String name;
  final String username;
  final String imageUrl;
  final bool isVerified;
  final bool isSelected;

  const TransferResultUserItem(
      {Key? key,
      required this.name,
      required this.username,
      required this.imageUrl,
      this.isVerified = false,
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
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
            child: isVerified
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: greenColor,
                        size: 14,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
          Text(
            '@$username',
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
