import 'package:flutter/material.dart';
import 'package:smart_office/theme/theme.dart';

import 'package:smart_office/widgets/main_screen/stack_over_flow/problem_details.dart';
import 'package:smart_office/models/problem_and_solution/problem_model.dart';

List<Widget> activeProblemsWidgets(
    List<Problem> problems, BuildContext context) {
  return problems
      .map((p) => InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProblemDetailsWidget(problem: p)));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              padding: const EdgeInsets.all(20),
              decoration: whiteBoxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          p.profileImage,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.creatorName,
                            style: const TextStyle(
                              height: 1.1,
                              color: AppColors.cyan,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            p.creatorPosition,
                            style: const TextStyle(
                              height: 1,
                              color: AppColors.cyan,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            p.dateToString,
                            style: const TextStyle(
                              height: 1.1,
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        p.isSolved
                            ? Icons.check_rounded
                            : Icons.watch_later_outlined,
                        color: AppColors.cyan,
                        size: 40,
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Text(
                    p.title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: AppColors.cyan,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Divider(height: 20),
                  Text(
                    p.content,
                    maxLines: 4,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: p.tags
                        .map(
                          (t) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: AppColors.purple,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              t,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ))
      .toList();
}
