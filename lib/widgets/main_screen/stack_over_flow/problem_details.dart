import 'package:flutter/material.dart';

import 'package:smart_office/models/problem_and_solution/problem_model.dart';
import 'package:smart_office/models/problem_and_solution/solution_model.dart';
import 'package:smart_office/requests/problems_requests/problems_requests.dart';
import 'package:smart_office/theme/pinch_zoom_image_widget.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/main_screen/stack_over_flow/add_solution_widget.dart';
import 'package:smart_office/widgets/main_screen/stack_over_flow/solution_widget.dart';
import 'package:smart_office/widgets/main_screen/stack_over_flow/user_answer_widget.dart';

class ProblemDetailsWidget extends StatefulWidget {
  const ProblemDetailsWidget({
    super.key,
    required this.problem,
  });

  final Problem problem;

  @override
  State<ProblemDetailsWidget> createState() {
    return _ProblemWidgetState();
  }
}

class _ProblemWidgetState extends State<ProblemDetailsWidget> {
  void _checkSolutions() async {
    List<Solution> activeSolutions =
        await ProblemsService().getSolutions(widget.problem.id);
    _solutions = activeSolutions;
    setState(() {});
  }

  List<Solution> _solutions = [];
  bool writingAnswer = false;

  @override
  void initState() {
    _checkSolutions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: bgForProblems, fit: BoxFit.cover)),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(14),
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
                            widget.problem.profileImage,
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
                              widget.problem.creatorName,
                              style: const TextStyle(
                                height: 1.1,
                                color: AppColors.cyan,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              widget.problem.creatorPosition,
                              style: const TextStyle(
                                height: 1,
                                color: AppColors.cyan,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              widget.problem.dateToString,
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
                          widget.problem.isSolved
                              ? Icons.check_rounded
                              : Icons.watch_later_outlined,
                          color: AppColors.cyan,
                          size: 40,
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    Text(
                      widget.problem.title,
                      style: const TextStyle(
                        color: AppColors.cyan,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(height: 20),
                    Text(
                      widget.problem.content,
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
                        ...widget.problem.urlImages.map(
                          (i) => PinchZoomImage(url: i),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: widget.problem.tags
                          .map(
                            (t) => Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.purple,
                                  borderRadius: BorderRadius.circular(30)),
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
              const AddSolutionWidget(),
              if (!writingAnswer)
                ..._solutions.map((s) => SolutionWidget(solution: s)).toList(),
              if (writingAnswer) const UserAnswerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
