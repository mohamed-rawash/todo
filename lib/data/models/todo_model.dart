import 'package:todo_app/domain/entities/todo_entities.dart';

class ToDoModel extends ToDo {
  const ToDoModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.completed,
  });

  factory ToDoModel.from(Map<String, dynamic> json) => ToDoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json['completed'],
      );
}
