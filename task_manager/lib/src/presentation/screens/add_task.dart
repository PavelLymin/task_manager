import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/blocs/task_bloc.dart';

import '../../domain/models/task.dart';

class TaskAddPage extends StatelessWidget {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerText = TextEditingController();
  TaskAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: controllerTitle,
          ),
          TextField(
            controller: controllerText,
          ),
          ElevatedButton(
            onPressed: () {
              final task = Task(
                id: 0,
                title: controllerTitle.text,
                text: controllerText.text,
              );
              final bloc = context.read<TaskBloc>();
              bloc.add(TaskAddEvent(task: task));
              controllerText.clear();
              controllerTitle.clear();
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}
