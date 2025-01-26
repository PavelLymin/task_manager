import 'package:task_manager/src/data/data_source/data_base_helper.dart';
import 'package:task_manager/src/domain/models/task.dart';
import 'package:task_manager/src/domain/repositories/TaskRepository.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<void> create(Task task) async {
    final db = await DataBaseHelper.instance.getDataBase;
    await db.rawInsert(
      'INSERT INTO task (title, text) VALUES (?, ?)',
      [task.title, task.text],
    );
  }

  @override
  Future<void> delete(int id) async {
    final db = await DataBaseHelper.instance.getDataBase;
    await db.rawDelete('DELETE FROM task WHERE id = ?', [id]);
  }

  @override
  Future<List<Task>> getAll() async {
    final db = await DataBaseHelper.instance.getDataBase;
    final List<Map<String, dynamic>> tasks =
        await db.rawQuery('SELECT * FROM task');
    return List.generate(
      tasks.length,
      (index) => Task(
        id: tasks[index]['id'],
        title: tasks[index]['title'],
        text: tasks[index]['text'],
      ),
    );
  }

  @override
  Future<void> update(Task task) async {
    final db = await DataBaseHelper.instance.getDataBase;
    await db.rawUpdate(
      'UPDATE task SET title = ?, text = ? WHERE id = ?',
      [task.title, task.text, task.id],
    );
  }
}
