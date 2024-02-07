import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuqood/models/payment_method_model.dart';
import 'package:nuqood/shared/theme.dart';

class CardListItem extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final String subTitle;
  final bool isSelected;

  const CardListItem(
      {Key? key,
      required this.paymentMethod,
      required this.subTitle,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding:  REdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2.w,
          color: isSelected ? blueColor : whiteColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            paymentMethod.thumbnail.toString(),
            height: 30.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethod.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
               SizedBox(
                height: 2.h,
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
