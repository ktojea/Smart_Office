import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class Comment {
  const Comment({
    required this.content,
    required this.createdAt,
    required this.creatorId,
    required this.creatorName,
    this.solutionId,
  });

  
  final String content;
  @JsonKey(name: 'created_at', includeToJson: false)
  final String createdAt;
  @JsonKey(name: 'creator_id')
  final int creatorId;
  @JsonKey(name: 'creator_name')
  final String creatorName;
  @JsonKey(name: 'problem_id', includeFromJson: false)
  final int? solutionId;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  get dateToString {
    final time = DateTime.parse(createdAt);
    final DateFormat formatter = DateFormat.yMMMMd();
    final formatted = formatter.format(time);
    return formatted;
  }
}