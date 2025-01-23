import 'package:task_manager/src/domain/repositories/TaskRepository.dart';

import '../models/task.dart';

class GetAllTask {
  final TaskRepository repository;
  GetAllTask({required this.repository});

  Future<List<Task>> call() async => await repository.getAll();
}
