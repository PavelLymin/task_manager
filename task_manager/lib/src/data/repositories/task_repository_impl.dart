import 'package:task_manager/src/data/data_source/data_base_helper.dart';
import 'package:task_manager/src/domain/models/task.dart';
import 'package:task_manager/src/domain/repositories/TaskRepository.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<void> create(Task task) async {
    var db = await DataBaseHelper.instance.getDataBase;
    db.rawInsert(
        'INSERT INTO task (id, title, text, isCompleted) VALUES (?, ?, ?, ?)',
        [task.id, task.title, task.text, task.isCompleted]);
  }

  @override
  Future<void> delete(int id) async {
    var db = await DataBaseHelper.instance.getDataBase;
    db.rawDelete('DELETE * FROM task WHERE id = ?', [id]);
  }

  @override
  Future<List<Task>> getAll() async {
    var db = await DataBaseHelper.instance.getDataBase;
    List<Map<String, dynamic>> tasks = await db!.rawQuery('SELECT * FROM task');
    return List.generate(
        tasks.length,
        (index) => Task(
            id: tasks[index]['id'],
            title: tasks[index]['title'],
            text: tasks[index]['text'],
            isCompleted: tasks[index]['isCompleted']));
  }

  @override
  Future<void> update(Task task) async {
    var db = await DataBaseHelper.instance.getDataBase;
    db.rawUpdate('UPDATE task SET title = ?, text = ?, isCompleted = ?',
        [task.title, task.text, task.isCompleted]);
  }
}
