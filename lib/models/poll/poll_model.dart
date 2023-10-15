import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poll_model.g.dart';

@JsonSerializable()
class Answer {
  Answer(this.text);

  String text;
  bool isSelected = false;

  static List<Answer> toAnswer(List<String> answers) {
    return answers.map((a) => Answer(a)).toList();
  }
}

@JsonSerializable()
class PollTopic {
  PollTopic({
    required this.title,
    required this.polls,
    this.anonymity = false,
    required this.createdAt,
    required this.creatorId,
    required this.creatorPosition,
    required this.profileImage,
    required this.id,
    required this.creatorName,
    required this.timeToComplete,
    required this.isActive,
  });

  get dateToString {
    final time = DateTime.parse(createdAt);
    final DateFormat formatter = DateFormat.yMMMMd();
    final formatted = formatter.format(time);
    return formatted;
  }

  @JsonKey(includeToJson: false)
  final String title;

  @JsonKey(name: 'creator_name', includeToJson: false)
  final String creatorName;

  @JsonKey(name: 'time_to_complete', includeToJson: false)
  final int timeToComplete;

  final List<Poll> polls;

  @JsonKey(name: 'is_anonymous', includeToJson: false)
  final bool anonymity;

  @JsonKey(includeFromJson: false)
  final Map<String, List<String>> data = {};

  final int id;

  @JsonKey(name: 'creator_id', includeToJson: false)
  final int creatorId;

  @JsonKey(name: 'creator_profile_image', includeToJson: false)
  final String profileImage;

  @JsonKey(name: 'creator_role', includeToJson: false)
  final String creatorPosition;

  @JsonKey(name: 'created_at', includeToJson: false)
  final String createdAt;

  @JsonKey(name: 'is_active', includeToJson: false)
  final bool isActive;

  factory PollTopic.fromJson(Map<String, dynamic> json) =>
      _$PollTopicFromJson(json);

  Map<String, dynamic> toJson() => _$PollTopicToJson(this);

  Map<String, List<String>> collectData() {
    for (final poll in polls) {
      if (poll.collectSelectedAnswers().isEmpty ||
          poll.collectSelectedAnswers() == ['']) {
        throw ('There are empty answers');
      }
      data[poll.question] = poll.collectSelectedAnswers();
    }
    return data;
  }
}

@JsonSerializable()
class Poll {
  Poll({
    required this.question,
    List<String> answers = const [],
    this.minNumberOfRequiredResponses = 1,
    int? maxNumberOfResponses = 1,
  })  : maxNumberOfResponses =
            (maxNumberOfResponses! > minNumberOfRequiredResponses)
                ? maxNumberOfResponses
                : minNumberOfRequiredResponses,
        answers = Answer.toAnswer(answers);

  String question;
  List<Answer> answers;

  @JsonKey(includeFromJson: false, includeToJson: false)
  int amountSelectedAnswers = 0;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String userInput = '';

  @JsonKey(name: 'min_responses')
  int minNumberOfRequiredResponses;

  @JsonKey(name: 'max_responses')
  int maxNumberOfResponses;

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  Map<String, dynamic> toJson() => _$PollToJson(this);

  trySelectAnswer(Answer answer) {
    if (!answer.isSelected && amountSelectedAnswers < maxNumberOfResponses) {
      amountSelectedAnswers++;
      answer.isSelected = true;
    } else if (answer.isSelected) {
      amountSelectedAnswers--;
      answer.isSelected = false;
    }
  }

  List<String> collectSelectedAnswers() {
    if (answers.isEmpty) return userInput.isNotEmpty ? [userInput] : [];
    List<String> selectedAnswers = [];
    for (final answer in answers) {
      if (answer.isSelected) {
        selectedAnswers.add(answer.text);
      }
    }
    return (selectedAnswers.length >= minNumberOfRequiredResponses)
        ? selectedAnswers
        : [];
  }
}
