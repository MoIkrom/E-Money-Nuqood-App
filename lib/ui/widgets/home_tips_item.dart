import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String url;

  const HomeTipsItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        }
      },
      child: Container(
        width: 155,
        height: 176,
        margin: EdgeInsets.only(right: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imageUrl,
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                    overflow: TextOverflow.ellipsis),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
