import 'package:flutter/material.dart';

import 'package:smart_office/models/poll/poll_model.dart';
import 'package:smart_office/theme/custom_buttons/button_answer_poll.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/main_screen/polls/poll.dart';

class PollTopicScreen extends StatefulWidget {
  const PollTopicScreen({
    super.key,
    required PollTopic this.pollTopic,
  });

  final PollTopic pollTopic;

  @override
  State<PollTopicScreen> createState() {
    return _PollsScreenState();
  }
}

class _PollsScreenState extends State<PollTopicScreen> {
  _sendData(PollTopic polls) {
    try {
      polls.collectData();
      Navigator.pop(context);
    } catch (e) {
      _errorText = 'Где-то не хватает ответов...';
    }
    setState(() {});
  }

  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: bgForPollTopic, fit: BoxFit.cover)),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  child: Text(
                    widget.pollTopic.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                ...widget.pollTopic.polls.map(
                  (p) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PollWidget(poll: p),
                  ),
                ),
                if (_errorText != '')
                  Text(
                    _errorText,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500),
                  ),
                const SizedBox(height: 10),
                GradientButton(
                  text: 'Завершить опрос',
                  fontSize: 20,
                  listColors: gradientList,
                  onPressed: () {
                    _sendData(widget.pollTopic);
                  },
                  isActive: true,
                  textInCenter: true,
                ),
                const SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
