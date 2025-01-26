part of 'task_bloc.dart';

abstract class TaskEvent {}

class TaskLoadEvent extends TaskEvent {}

class TaskAddEvent extends TaskEvent {
  final Task task;
  TaskAddEvent({required this.task});
}

class TaskEditEvent extends TaskEvent {
  final Task task;
  TaskEditEvent({required this.task});
}

class TaskDeleteEvent extends TaskEvent {
  final int taskId;
  TaskDeleteEvent({required this.taskId});
}
