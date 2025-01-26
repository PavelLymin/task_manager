import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/blocs/task_bloc.dart';
import 'package:task_manager/src/presentation/screens/add_task.dart';
import 'package:task_manager/src/presentation/screens/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()..add(TaskLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task list'),
        ),
        body: Column(
          children: [
            Column(
              children: [
                TaskAddPage(),
                TaskList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
