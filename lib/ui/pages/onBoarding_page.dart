import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuqood/shared/theme.dart';
import 'package:nuqood/ui/widgets/buttons.dart';

class onBoardingPage extends StatefulWidget {
  const onBoardingPage({super.key});

  @override
  State<onBoardingPage> createState() => _onBoardingPageState();
}

class _onBoardingPageState extends State<onBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build from\nZero to Freedom',
    'Start Together',
  ];
  List<String> subTitles = [
    'Our System is helping you to\nachieve a beter goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too',
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: [
                    Image.asset(
                      'assets/img_provider_telkomsel.png',
                      height: 331.h,
                    ),
                    Image.asset(
                      'assets/img_provider_singtel.png',
                      height: 331.h,
                    ),
                    Image.asset(
                      'assets/img_provider_indosat.png',
                      height: 331.h,
                    )
                  ],
                  options: CarouselOptions(
                      height: 331.h,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                  carouselController: carouselController,
                ),
                SizedBox(
                  height: 80.h,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                  decoration: BoxDecoration(
                      color: whiteColor, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text(
                        titles[currentIndex],
                        style: blackTextStyle.copyWith(
                            fontSize: 25, fontWeight: extraBold),
                        textAlign: TextAlign.center,
                      ),
                       SizedBox(
                        height: 26.h,
                      ),
                      Text(
                        subTitles[currentIndex],
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: currentIndex == 2 ? 38.h : 50.h,
                      ),
                      currentIndex == 2
                          ? Column(
                              children: [
                                CustomFilledButton(
                                  title: "Get Started",
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/sign-up', (route) => false);
                                  },
                                ),
                                 SizedBox(
                                  height: 20.h,
                                ),
                                CustomtextButton(
                                  title: "Sign In",
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/sign-in', (route) => false);
                                  },
                                )
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                  width: 12.w,
                                  height: 12.h,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == 0
                                          ? blueColor
                                          : lightBackgroundColor),
                                ),
                                Container(
                                  width: 12.w,
                                  height: 12.h,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == 1
                                          ? blueColor
                                          : lightBackgroundColor),
                                ),
                                Container(
                                  width: 12.w,
                                  height: 12.h,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == 2
                                          ? blueColor
                                          : lightBackgroundColor),
                                ),
                                const Spacer(),
                                CustomFilledButton(
                                    title: "Continue",
                                    onPressed: () {
                                      carouselController.nextPage();
                                    },
                                    width: 150.w)
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
