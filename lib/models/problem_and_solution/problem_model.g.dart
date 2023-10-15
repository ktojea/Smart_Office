// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problem _$ProblemFromJson(Map<String, dynamic> json) => Problem(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      urlImages:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: json['created_at'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      creatorId: json['creator_id'] as int,
      creatorName: json['creator_name'] as String,
      profileImage: json['creator_profile_image'] as String,
      creatorPosition: json['creator_role'] as String,
      isSolved: json['is_solved'] as bool,
    );

Map<String, dynamic> _$ProblemToJson(Problem instance) => <String, dynamic>{
      'tags': instance.tags,
    };
