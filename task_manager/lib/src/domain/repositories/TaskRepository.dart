import 'package:task_manager/src/domain/models/task.dart';

abstract class TaskRepository {
  Future<void> create(Task task);
  Future<List<Task>> getAll();
  Future<void> update(Task task);
  Future<void> delete(int id);
}
