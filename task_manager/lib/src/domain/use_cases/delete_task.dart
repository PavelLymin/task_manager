import 'package:task_manager/src/domain/repositories/TaskRepository.dart';

class DeleteTask {
  final TaskRepository repository;
  DeleteTask({required this.repository});

  Future<void> deleteTask(int id) async => await repository.delete(id);
}
