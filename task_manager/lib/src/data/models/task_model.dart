import '../../domain/models/task.dart';

class TaskModel extends Task {
  TaskModel(
      {required super.id,
      required super.title,
      required super.text,
      required super.isCompleted});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'isCompleted': isCompleted,
    };
  }
}
