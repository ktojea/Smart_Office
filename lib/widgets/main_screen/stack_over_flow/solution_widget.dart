import 'package:flutter/material.dart';

import 'package:smart_office/models/problem_and_solution/solution_model.dart';
import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/main_screen/stack_over_flow/comments_widget.dart';

class SolutionWidget extends StatefulWidget {
  const SolutionWidget({
    super.key,
    required this.solution,
  });

  final Solution solution;

  @override
  State<SolutionWidget> createState() {
    return _SolutionWidgetState();
  }
}

class _SolutionWidgetState extends State<SolutionWidget> {
  final _textControllerForComment = TextEditingController();
  bool showComments = false;

  _showComments() {
    if (showComments) {
      showComments = false;
    } else {
      showComments = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                  widget.solution.profileImage,
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
                    widget.solution.creatorName,
                    style: const TextStyle(
                      height: 0.8,
                      color: AppColors.cyan,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.solution.creatorPosition,
                    style: const TextStyle(
                      height: 1,
                      color: AppColors.cyan,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.solution.dateToString,
                    style: const TextStyle(
                      height: 1.1,
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 20),
          Text(
            widget.solution.content,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              ...widget.solution.urlImages
                  .map((i) => ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(i),
                      ))
                  .toList(),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    fontSize: 16,
                    maxLines: 5,
                    color: AppColors.cyan,
                    controller: _textControllerForComment,
                    textLabel: 'Ваш комментарий',
                    icon: Icons.mode_edit_outline_outlined,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.send_rounded)),
              ],
            ),
          ),
          if (!showComments)
            TextButton.icon(
              icon: Icon(
                widget.solution.comments.isNotEmpty
                    ? Icons.arrow_downward_rounded
                    : Icons.comments_disabled_outlined,
                size: 20,
                color: AppColors.cyan,
              ),
              onPressed: widget.solution.comments.isNotEmpty
                  ? () {
                      _showComments();
                    }
                  : null,
              label: Text(
                widget.solution.comments.isNotEmpty
                    ? 'Показать комментарии'
                    : 'Комментарии отстутсвуют',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.cyan,
                ),
              ),
            ),
          if (showComments) ...[
            CommentsWidget(listComments: widget.solution.comments),
            TextButton.icon(
              icon: const Icon(
                Icons.arrow_upward_rounded,
                size: 20,
                color: AppColors.cyan,
              ),
              onPressed: () {
                _showComments();
              },
              label: const Text(
                'Скрыть комментарии',
                style: TextStyle(fontSize: 14, color: AppColors.cyan),
              ),
            )
          ],
        ],
      ),
    );
  }
}
