import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';


part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  const Profile({
    required this.age,
    required this.createdAt,
    required this.email,
    required this.id,
    required this.profileImage,
    required this.role,
    required this.sex,
    required this.surname,
    required this.name,
    required this.amountOfContacts,
    required this.bio,
    required this.monthsWorksAtCompany,
    required this.rating,
    required this.amountOfProblemAnswers,
  });

  
  final int id;
  @JsonKey(includeToJson: false)
  final int age;
  @JsonKey(includeToJson: false)
  final String email;
  @JsonKey(includeToJson: false)
  final String surname;
  @JsonKey(includeToJson: false)
  final String role;
  @JsonKey(includeToJson: false)
  final String sex;
  @JsonKey(name: 'profile_image', includeToJson: false)
  final String profileImage;
  @JsonKey(name: 'created_at', includeToJson: false)
  final String createdAt;
  @JsonKey(includeToJson: false)
  final String name;
  @JsonKey(includeToJson: false)
  final String bio;
  @JsonKey(includeToJson: false)
  final int rating;
  @JsonKey(name: 'works_at_company', includeToJson: false)
  final int monthsWorksAtCompany;
  @JsonKey(name: 'amount_of_contacts', includeToJson: false)
  final int amountOfContacts;
  @JsonKey(name: 'amount_of_problem_answers', includeToJson: false)
  final int amountOfProblemAnswers;
  



  get dateToString {
    final time = DateTime.parse(createdAt);
    final DateFormat formatter = DateFormat.yMMMMd();
    final formatted = formatter.format(time);
    return formatted;
  }

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
