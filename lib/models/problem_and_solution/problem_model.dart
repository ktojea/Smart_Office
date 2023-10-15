import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'problem_model.g.dart';

@JsonSerializable()
class Problem {
  const Problem({
    required this.id,
    required this.title,
    required this.content,
    required this.urlImages,
    required this.createdAt,
    required this.tags,
    required this.creatorId,
    required this.creatorName,
    required this.profileImage,
    required this.creatorPosition,
    required this.isSolved,
  });

  @JsonKey(includeToJson: false)
  final int id;
  @JsonKey(includeToJson: false)
  final String title;
  @JsonKey(includeToJson: false)
  final String content;
  @JsonKey(name: 'images', includeToJson: false)
  final List<String> urlImages;
  @JsonKey(name: 'created_at', includeToJson: false)
  final String createdAt;
  final List<String> tags;
  @JsonKey(name: 'creator_id', includeToJson: false)
  final int creatorId;
  @JsonKey(name: 'creator_name', includeToJson: false)
  final String creatorName;
  @JsonKey(name: 'creator_profile_image', includeToJson: false)
  final String profileImage;
  @JsonKey(name: 'creator_role', includeToJson: false)
  final String creatorPosition;
  @JsonKey(name: 'is_solved', includeToJson: false)
  final bool isSolved;


  factory Problem.fromJson(Map<String, dynamic> json) => _$ProblemFromJson(json);

  Map<String, dynamic> toJson() => _$ProblemToJson(this);

  get dateToString {
    final time = DateTime.parse(createdAt);
    final DateFormat formatter = DateFormat.yMMMMd();
    final formatted = formatter.format(time);
    return formatted;
  }

}
