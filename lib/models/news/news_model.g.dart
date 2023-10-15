// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      creatorId: json['creator_id'] as int,
      creatorName: json['creator_name'] as String,
      creatorPosition: json['creator_role'] as String,
      creatorProfileImage: json['creator_profile_image'] as String,
      id: json['id'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'creator_id': instance.creatorId,
    };
