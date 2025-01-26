import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/data/repositories/task_repository_impl.dart';
import 'package:task_manager/src/domain/models/task.dart';
import 'package:task_manager/src/domain/repositories/TaskRepository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository = TaskRepositoryImpl();

  TaskBloc() : super(TaskInitial()) {
    on<TaskLoadEvent>((event, emit) async {
      await _loadTaskList(emit);
    });
    on<TaskAddEvent>((event, emit) async {
      await repository.create(event.task);
      await _loadTaskList(emit);
    });

    on<TaskEditEvent>((event, emit) async {
      print("Updating task: ${event.task}"); // Логируем задачу
      await repository.update(event.task); // Обновление задачи
      print("Task updated successfully!");
      await _loadTaskList(emit);
    });

    on<TaskDeleteEvent>((event, emit) async {
      await repository.delete(event.taskId);
      await _loadTaskList(emit);
    });
  }

  Future<void> _loadTaskList(Emitter<TaskState> emit) async {
    try {
      final List<Task> tasks = await repository.getAll();
      emit(TaskLoadedState(taskList: tasks));
    } catch (e) {
      emit(TaskErrorState(message: e.toString()));
    }
  }
}
