import 'package:flutter/material.dart';

import 'package:smart_office/models/poll/poll_model.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/main_screen/polls/poll_topic_screen.dart';

class PollTopicWidget extends StatelessWidget {
  const PollTopicWidget({
    super.key,
    required this.pollTopic,
  });

  final PollTopic pollTopic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PollTopicScreen(pollTopic: pollTopic),));},
      child: Container(
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: bgForPollTopicWidget, fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    pollTopic.profileImage,
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
                      pollTopic.creatorName,
                      style: const TextStyle(
                        height: 0.8,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      pollTopic.creatorPosition,
                      style: const TextStyle(
                        height: 1,
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      pollTopic.dateToString,
                      style: const TextStyle(
                        height: 1.1,
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Text(
              pollTopic.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Примерное время прохождения: ${pollTopic.timeToComplete.toString()} минут',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
