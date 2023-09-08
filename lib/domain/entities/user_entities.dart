import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String website;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        website,
      ];
}
