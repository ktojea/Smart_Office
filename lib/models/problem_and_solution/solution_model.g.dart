// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Solution _$SolutionFromJson(Map<String, dynamic> json) => Solution(
      id: json['entry_id'] as int,
      content: json['content'] as String,
      urlImages:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: json['created_at'] as String,
      creatorId: json['creator_id'] as int,
      creatorName: json['creator_name'] as String,
      profileImage: json['profile_image'] as String,
      creatorPosition: json['creator_role'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      problemId: json['problem_id'] as int,
    );

Map<String, dynamic> _$SolutionToJson(Solution instance) => <String, dynamic>{
      'problem_id': instance.problemId,
      'comments': instance.comments,
    };
