import 'package:flutter/material.dart';
import 'package:smart_office/models/problem_and_solution/comment_model.dart';
import 'package:smart_office/requests/profile_requests/profile_requests.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/profile_screen/profile_screen.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    super.key,
    required this.listComments,
  });

  final List<Comment> listComments;

  _openProfile(int creatorId, BuildContext context) async {
    final profie = await ProfileService().getProfile(creatorId);
    if (!context.mounted) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(profile: profie),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: listComments
          .map((c) => SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Divider(),
                    Text(c.content),
                    const Text('–'),
                    SizedBox(
                      height: 20,
                      child: TextButton(
                          onPressed: () {
                            _openProfile(c.creatorId, context);
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Text(
                            c.creatorName,
                            style: const TextStyle(
                                fontSize: 14, color: AppColors.cyan),
                          )),
                    ),
                    Text(
                      c.dateToString,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
