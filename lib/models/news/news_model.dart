import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';


part 'news_model.g.dart';

@JsonSerializable()
class News {
  const News({
    required this.content,
    required this.createdAt,
    required this.creatorId,
    required this.creatorName,
    required this.creatorPosition,
    required this.creatorProfileImage,
    required this.id,
    required this.images,
  });

  @JsonKey(includeToJson: false)
  final List<String> images;
  @JsonKey(name: 'creator_id')
  final int creatorId;
  @JsonKey(includeToJson: false)
  final String content;
  @JsonKey(name: 'created_at', includeToJson: false)
  final String createdAt;
  @JsonKey(includeToJson: false)
  final int id;
  @JsonKey(name: 'creator_name', includeToJson: false)
  final String creatorName;
  @JsonKey(name: 'creator_profile_image', includeToJson: false)
  final String creatorProfileImage;
  @JsonKey(name: 'creator_role', includeToJson: false)
  final String creatorPosition;

  get dateToString {
    final time = DateTime.parse(createdAt);
    final DateFormat formatter = DateFormat.yMMMMd();
    final formatted = formatter.format(time);
    return formatted;
  }

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
