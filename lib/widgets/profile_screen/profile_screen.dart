import 'package:flutter/material.dart';

import 'package:smart_office/models/profile/profile_model.dart';
import 'package:smart_office/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: bgForReg, fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        padding: const EdgeInsets.all(10),
                        decoration: whiteBoxDecoration,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.settings_outlined,
                                      size: 30,
                                    )),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share_outlined,
                                      size: 30,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Text(
                              '${profile.name} ${profile.surname}',
                              style: const TextStyle(
                                color: AppColors.purple,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              profile.email,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              profile.role,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(14),
                        padding: const EdgeInsets.all(10),
                        decoration: whiteBoxDecoration,
                        child: Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            profile.amountOfContacts.toString(),
                                            style: const TextStyle(
                                              color: AppColors.purple,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            'контактов',
                                            style: TextStyle(
                                              height: 0.8,
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const VerticalDivider(width: 30),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            profile.amountOfProblemAnswers
                                                .toString(),
                                            style: const TextStyle(
                                              color: AppColors.purple,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            'ответов',
                                            style: TextStyle(
                                              height: 0.8,
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                            const Divider(),
                            IntrinsicHeight(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            '${profile.monthsWorksAtCompany}-й месяц',
                                            style: const TextStyle(
                                              color: AppColors.purple,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            'в компании',
                                            style: TextStyle(
                                              height: 0.8,
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const VerticalDivider(width: 30),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            '${profile.rating}%',
                                            style: const TextStyle(
                                              color: AppColors.purple,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            'рейтинг',
                                            style: TextStyle(
                                              height: 0.8,
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(profile.profileImage),
                      radius: 74,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: whiteBoxDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Обо мне',
                      style: TextStyle(
                        color: AppColors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      profile.bio,
                      style: const TextStyle(
                        height: 1,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
