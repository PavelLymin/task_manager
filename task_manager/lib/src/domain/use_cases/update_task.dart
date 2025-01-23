import 'package:task_manager/src/domain/models/task.dart';
import 'package:task_manager/src/domain/repositories/TaskRepository.dart';

class UpdateTask {
  final TaskRepository repository;
  UpdateTask({required this.repository});

  Future<void> updateTask(Task task) async => await repository.update(task);
}
