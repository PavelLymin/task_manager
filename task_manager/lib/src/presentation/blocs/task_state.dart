part of 'task_bloc.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoadingState extends TaskState {}

class TaskLoadedState extends TaskState {
  final List<Task> taskList;
  TaskLoadedState({required this.taskList});
}

class TaskErrorState extends TaskState {
  final String message;
  TaskErrorState({required this.message});
}
