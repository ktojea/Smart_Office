// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      creatorId: json['creator_id'] as int,
      creatorName: json['creator_name'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'content': instance.content,
      'creator_id': instance.creatorId,
      'creator_name': instance.creatorName,
    };
