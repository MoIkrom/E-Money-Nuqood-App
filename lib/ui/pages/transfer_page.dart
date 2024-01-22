import "package:flutter/material.dart";
import "package:nuqood/shared/theme.dart";
import "package:nuqood/ui/widgets/buttons.dart";
import "package:nuqood/ui/widgets/forms.dart";
import "package:nuqood/ui/widgets/transfer_recent_user_item.dart";
import "package:nuqood/ui/widgets/transfer_result_user_item.dart";

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Search",
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: black,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: "By Username",
            isShowTitle: false,
          ),
          // if(textController.text == '')
          // buildRecentUsers(),
          buildResult(),
          SizedBox(
            height: 100,
          ),
          CustomFilledButton(
            title: "Continue",
            onPressed: (){
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),   SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: black,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            name: "Muhammad Ikram",
            username: 'Mo.ikrom',
            imageUrl: 'assets/ikram.jpg',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            name: "Muhammad Ikram",
            username: 'Mo.ikrom',
            imageUrl: 'assets/ikram.jpg',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            name: "Muhammad Ikram",
            username: 'Mo.ikrom',
            imageUrl: 'assets/ikram.jpg',
            isVerified: true,
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: black,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              const TransferResultUserItem(
                name: "Muhammad Ikram",
                username: "mo.ikrom",
                imageUrl: "assets/ikram.jpg",
                isVerified: true,
                isSelected: true,
              ),
              const TransferResultUserItem(
                name: "Muhammad Ikram",
                username: "mo.ikrom",
                imageUrl: "assets/ikram.jpg",
              ),
              const TransferResultUserItem(
                name: "Muhammad Ikram",
                username: "mo.ikrom",
                imageUrl: "assets/ikram.jpg",
              ),
              const TransferResultUserItem(
                name: "Muhammad Ikram",
                username: "mo.ikrom",
                imageUrl: "assets/ikram.jpg",
              ),
            ],
          )
        ],
      ),
    );
  }
}
