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
  });

  
  final String content;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'creator_id')
  final int creatorId;
  @JsonKey(name: 'creator_name')
  final String creatorName;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  get dateToString {
    final time = DateTime.parse(createdAt);
    final DateFormat formatter = DateFormat.yMMMMd();
    final formatted = formatter.format(time);
    return formatted;
  }
}