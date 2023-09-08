import 'package:todo_app/domain/entities/user_entities.dart';

class UsersModel extends User {
  const UsersModel({
    required super.id,
    required super.name,
    required super.email,
    required super.website,
  });

  factory UsersModel.from(Map<String, dynamic> json) => UsersModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        website: json['website'],
      );
}
