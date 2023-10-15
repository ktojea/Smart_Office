// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      json['text'] as String,
    )..isSelected = json['isSelected'] as bool;

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'text': instance.text,
      'isSelected': instance.isSelected,
    };

PollTopic _$PollTopicFromJson(Map<String, dynamic> json) => PollTopic(
      title: json['title'] as String,
      polls: (json['polls'] as List<dynamic>)
          .map((e) => Poll.fromJson(e as Map<String, dynamic>))
          .toList(),
      anonymity: json['is_anonymous'] as bool? ?? false,
      createdAt: json['created_at'] as String,
      creatorId: json['creator_id'] as int,
      creatorPosition: json['creator_role'] as String,
      profileImage: json['creator_profile_image'] as String,
      id: json['id'] as int,
      creatorName: json['creator_name'] as String,
      timeToComplete: json['time_to_complete'] as int,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$PollTopicToJson(PollTopic instance) => <String, dynamic>{
      'polls': instance.polls,
      'id': instance.id,
    };

Poll _$PollFromJson(Map<String, dynamic> json) => Poll(
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      minNumberOfRequiredResponses: json['min_responses'] as int? ?? 1,
      maxNumberOfResponses: json['max_responses'] as int? ?? 1,
    );

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'min_responses': instance.minNumberOfRequiredResponses,
      'max_responses': instance.maxNumberOfResponses,
    };
