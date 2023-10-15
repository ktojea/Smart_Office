import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

import 'package:smart_office/models/problem_and_solution/comment_model.dart';

part 'solution_model.g.dart';

@JsonSerializable()
class Solution {
  const Solution({
    required this.id,
    required this.content,
    required this.urlImages,
    required this.createdAt,
    required this.creatorId,
    required this.creatorName,
    required this.profileImage,
    required this.creatorPosition,
    required this.comments,
    required this.problemId,
  });

  @JsonKey(name: 'entry_id', includeToJson: false)
  final int id;
  @JsonKey(name: 'problem_id')
  final int problemId;
  @JsonKey(includeToJson: false)
  final String content;
  @JsonKey(name: 'images', includeToJson: false)
  final List<String> urlImages;
  @JsonKey(name: 'created_at', includeToJson: false)
  final String createdAt;
  @JsonKey(name: 'creator_id', includeToJson: false)
  final int creatorId;
  @JsonKey(name: 'creator_name', includeToJson: false)
  final String creatorName;
  @JsonKey(name: 'profile_image', includeToJson: false)
  final String profileImage;
  @JsonKey(name: 'creator_role', includeToJson: false)
  final String creatorPosition;
  final List<Comment> comments;


  factory Solution.fromJson(Map<String, dynamic> json) => _$SolutionFromJson(json);

  Map<String, dynamic> toJson() => _$SolutionToJson(this);

  get dateToString {
    final time = DateTime.parse(createdAt);
    final DateFormat formatter = DateFormat.yMMMMd();
    final formatted = formatter.format(time);
    return formatted;
  }
}