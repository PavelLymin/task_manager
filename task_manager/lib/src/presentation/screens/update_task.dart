import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/blocs/task_bloc.dart';

import '../../domain/models/task.dart';

class UpdateTask extends StatelessWidget {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerText = TextEditingController();
  final int id;
  final String title;
  final String text;
  UpdateTask(
      {super.key, required this.title, required this.text, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controllerTitle,
              decoration: InputDecoration(hintText: title),
            ),
            TextField(
              controller: controllerText,
              decoration: InputDecoration(hintText: text),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  final task = Task(
                      id: id,
                      title: controllerTitle.text,
                      text: controllerText.text);
                  context.read<TaskBloc>().add(TaskEditEvent(task: task));
                  controllerTitle.clear();
                  controllerText.clear();
                  Navigator.pop(context);
                },
                child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
