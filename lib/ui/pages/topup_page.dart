import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nuqood/blocs/auth/auth_bloc.dart";
import "package:nuqood/blocs/payment_method/payment_method_bloc.dart";
import "package:nuqood/models/payment_method_model.dart";
import "package:nuqood/models/top_up_fom_model.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/pages/topup_amount_page.dart";
import 'package:nuqood/ui/widgets/card_list_item.dart';
import "package:nuqood/ui/widgets/buttons.dart";

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Top Up",
      )),
      body: ListView(
        padding: REdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset(
                      'assets/img_wallet.png',
                      width: 80.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          state.user.name.toString(),
                          style: greyTextStyle,
                        ),
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children: state.paymentMethods.map((paymentMethod) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPayment = paymentMethod;
                          });
                        },
                        child: CardListItem(
                          paymentMethod: paymentMethod,
                          subTitle: "15 Mins",
                          isSelected: paymentMethod.id == selectedPayment?.id,
                        ),
                      );
                    }).toList(),
                  );
                }
                return Column(
                  children: [
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          if (selectedPayment != null)
            CustomFilledButton(
              title: "Continue",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopupAmountPage(
                      data: TopupFormModel(
                        paymentMethodCode: selectedPayment?.code,
                      ),
                    ),
                  ),
                );
              },
            ),
          SizedBox(
            height: 57.h,
          ),
        ],
      ),
    );
  }
}
