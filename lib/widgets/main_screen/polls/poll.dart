import 'package:flutter/material.dart';

import 'package:smart_office/models/poll/poll_model.dart';
import 'package:smart_office/theme/custom_buttons/button_answer_poll.dart';
import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';

class PollWidget extends StatefulWidget {
  const PollWidget({super.key, required this.poll});

  final Poll poll;

  @override
  State<PollWidget> createState() {
    return _PollWidgetScreen();
  }
}

class _PollWidgetScreen extends State<PollWidget> {
  _selectAnswer(Answer answer) {
    widget.poll.trySelectAnswer(answer);
    setState(() {});
  }

  final _userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: whiteBoxDecoration,
      child: Wrap(
        runSpacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.poll.answers.isNotEmpty
                  ? '${widget.poll.question} ${widget.poll.amountSelectedAnswers}/${widget.poll.minNumberOfRequiredResponses}'
                  : widget.poll.question,
              style: textStyleQuestion,
            ),
          ),
          if (widget.poll.answers.isEmpty)
            CustomTextField(
              textLabel: 'Ваш ответ',
              maxLines: 5,
              controller: _userInput,
              onChanged: (String text) {
                widget.poll.userInput = _userInput.text;
              },
            ),
          ...widget.poll.answers.map((a) => GradientButton(
                onPressed: () {
                  _selectAnswer(a);
                },
                text: a.text,
                fontSize: 14,
                isActive: a.isSelected,
                listColors: gradientList,
              )),
        ],
      ),
    );
  }
}
