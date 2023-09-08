import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const ToDo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        id,
        title,
        completed,
      ];
}
