import 'package:task_manager/src/domain/repositories/TaskRepository.dart';

import '../models/task.dart';

class CreateTask {
  final TaskRepository repository;
  CreateTask({required this.repository});

  Future<void> createTask(Task task) async => await repository.create(task);
}
