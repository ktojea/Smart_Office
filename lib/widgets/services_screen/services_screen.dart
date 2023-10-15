import 'package:flutter/material.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';


class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          image: DecorationImage(image: bgForPollTopic, fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Сервисы',
              style: TextStyle(
                  height: 0.8,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Spacer(flex: 2),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Image(
                image: bgForFavourites,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () {
                print(123);
                final Uri url = Uri.parse('https://www.pomidorko.ru');
                launchUrl(url);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: const Image(
                  image: bgForPomodoro,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Image(
                image: bgForSmartOfficeWidget,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
