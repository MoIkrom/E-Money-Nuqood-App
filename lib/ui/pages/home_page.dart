import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nuqood/blocs/auth/auth_bloc.dart";
import "package:nuqood/shared/shared_methods.dart";
import "package:nuqood/shared/theme.dart";
import 'package:nuqood/ui/widgets/home_latest_transaction_item.dart';
import "package:nuqood/ui/widgets/home_services_item.dart";
import "package:nuqood/ui/widgets/home_tips_item.dart";
import "package:nuqood/ui/widgets/home_user_item.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: whiteColor,
            selectedItemColor: blueColor,
            unselectedItemColor: blackColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle:
                blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
            unselectedLabelStyle:
                blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/ic_overview.png',
                    width: 20.w,
                    color: blueColor,
                  ),
                  label: 'Overview'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/ic_history.png',
                    width: 20.w,
                  ),
                  label: 'History'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/ic_statistic.png',
                    width: 20.w,
                  ),
                  label: 'Statistic'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/ic_reward.png',
                    width: 20.w,
                  ),
                  label: 'Reward'),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24.w,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransaction(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(
              top: 60,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        state.user.username.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: bold),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: state.user.profilePicture == null
                              ? const AssetImage(
                                  'assets/user-picture.png',
                                )
                              : NetworkImage(state.user.profilePicture!)
                                  as ImageProvider,
                        ),
                      ),
                      child: state.user.verified == 1
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 16.w,
                                height: 16.h,
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
                  )
                ]),
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            height: 220.h,
            margin: REdgeInsets.only(
              top: 30,
            ),
            padding: REdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28).r,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_bg_card.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  runSpacing: 20.h,
                  children: [
                    Text(
                      state.user.name.toString(),
                      style: whiteTextStyle.copyWith(
                          fontSize: 18.sp, fontWeight: bold),
                    ),
                    Text(
                      "**** **** **** ${state.user.cardNumber!.substring(12, 16)}",
                      style: whiteTextStyle.copyWith(
                          fontSize: 18.sp, fontWeight: bold, letterSpacing: 8),
                    ),
                  ],
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Balance",
                      style: whiteTextStyle,
                    ),
                    Text(
                      // formatCurrency(state.user.balance ?? 0),
                      state.user.balance.toString(),
                      style: whiteTextStyle.copyWith(
                          fontSize: 22.sp, fontWeight: bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Level 1",
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
              const Spacer(),
              Text(
                "50% ",
                style: greenTextStyle.copyWith(fontWeight: bold),
              ),
              Text(
                "of ${formatCurrency(35000)}",
                style: blackTextStyle.copyWith(fontWeight: bold),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              minHeight: 5,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do Something",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServicesItem(
                title: "Top Up",
                iconUrl: 'assets/ic_topup.png',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServicesItem(
                title: "Send",
                iconUrl: 'assets/ic_send.png',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServicesItem(
                title: "Withdraw",
                iconUrl: 'assets/ic_withdraw.png',
                onTap: () {},
              ),
              HomeServicesItem(
                title: "More",
                iconUrl: 'assets/ic_more.png',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => MoreDialog(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLatestTransaction() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Transactions",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: extraBold),
          ),
          Container(
              padding: const EdgeInsets.all(22),
              margin: const EdgeInsets.only(top: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  HomeLatestTransactionItem(
                    title: "Top Up",
                    iconUrl: "assets/ic_transaction_cat1.png",
                    time: "yesterday",
                    value: "+ ${formatCurrency(250000, symbol: '')}",
                  ),
                  HomeLatestTransactionItem(
                    title: "Cashback",
                    iconUrl: "assets/ic_transaction_cat2.png",
                    time: "yesterday",
                    value: "+ ${formatCurrency(250000, symbol: '')}",
                  ),
                  HomeLatestTransactionItem(
                    title: "Withdraw",
                    iconUrl: "assets/ic_transaction_cat3.png",
                    time: "yesterday",
                    value: "+ ${formatCurrency(250000, symbol: '')}",
                  ),
                  HomeLatestTransactionItem(
                    title: "Transfer",
                    iconUrl: "assets/ic_transaction_cat4.png",
                    time: "yesterday",
                    value: "+ ${formatCurrency(250000, symbol: '')}",
                  ),
                  HomeLatestTransactionItem(
                    title: "Electric",
                    iconUrl: "assets/ic_transaction_cat5.png",
                    time: "yesterday",
                    value: "+ ${formatCurrency(250000, symbol: '')} ",
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send Again",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: black),
          ),
          SizedBox(
            height: 14.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomeUserItem(
                  username: "Alexander",
                  imageUrl: 'assets/img_profile.png',
                ),
                HomeUserItem(
                  username: "Alexander",
                  imageUrl: 'assets/img_profile.png',
                ),
                HomeUserItem(
                  username: "Alexander",
                  imageUrl: 'assets/img_profile.png',
                ),
                HomeUserItem(
                  username: "Alexander",
                  imageUrl: 'assets/img_profile.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Friendly Tips",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: black),
          ),
          SizedBox(
            height: 14.h,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 19,
            children: const [
              HomeTipsItem(
                title: "Cara Agar Rajin Menabung",
                imageUrl: 'assets/img_tips2.png',
                url: 'https://class.buildwithangga.com/my-resume',
              ),
              HomeTipsItem(
                title: "Cara Agar Rajin Menabung",
                imageUrl: 'assets/img_tips3.png',
                url: 'https://class.buildwithangga.com/my-resume',
              ),
              HomeTipsItem(
                title: "Cara Agar Rajin Menabung",
                imageUrl: 'assets/img_tips4.png',
                url: 'https://class.buildwithangga.com/my-resume',
              ),
              HomeTipsItem(
                title: "Cara Agar Rajin Menabung",
                imageUrl: 'assets/img_tips2.png',
                url: 'https://class.buildwithangga.com/my-resume',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326.h,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Do More With Us",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(children: [
              Wrap(
                runSpacing: 20,
                spacing: 29,
                children: [
                  HomeServicesItem(
                    title: "Data",
                    iconUrl: 'assets/ic_product_data.png',
                    onTap: () {
                      Navigator.pushNamed(context, '/data-provider');
                    },
                  ),
                  HomeServicesItem(
                    title: "Water",
                    iconUrl: 'assets/ic_product_water.png',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => disableContent(),
                      );
                    },
                    isDisable: true,
                  ),
                  HomeServicesItem(
                    title: "Stream",
                    iconUrl: 'assets/ic_product_stream.png',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => disableContent(),
                      );
                    },
                    isDisable: true,
                  ),
                  HomeServicesItem(
                    title: "Movie",
                    iconUrl: 'assets/ic_product_movie.png',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => disableContent(),
                      );
                    },
                    isDisable: true,
                  ),
                  HomeServicesItem(
                    title: "Food",
                    iconUrl: 'assets/ic_product_food.png',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => disableContent(),
                      );
                    },
                    isDisable: true,
                  ),
                  HomeServicesItem(
                    title: "Travel",
                    iconUrl: 'assets/ic_product_travel.png',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => disableContent(),
                      );
                    },
                    isDisable: true,
                  ),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class disableContent extends StatelessWidget {
  const disableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      content: Container(
        height: 100.h,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightBackgroundColor,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mohon Maaf Fitur masi dalam pengembangan",
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
