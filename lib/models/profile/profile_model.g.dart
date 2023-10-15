// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      age: json['age'] as int,
      createdAt: json['created_at'] as String,
      email: json['email'] as String,
      id: json['id'] as int,
      profileImage: json['profile_image'] as String,
      role: json['role'] as String,
      sex: json['sex'] as String,
      surname: json['surname'] as String,
      name: json['name'] as String,
      amountOfContacts: json['amount_of_contacts'] as int,
      bio: json['bio'] as String,
      monthsWorksAtCompany: json['works_at_company'] as int,
      rating: json['rating'] as int,
      amountOfProblemAnswers: json['amount_of_problem_answers'] as int,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
    };
