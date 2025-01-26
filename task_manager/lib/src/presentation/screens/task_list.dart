import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/screens/update_task.dart';

import '../blocs/task_bloc.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoadedState) {
          return Container(
            height: 500,
            padding: const EdgeInsets.all(25),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.taskList.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.taskList[index].id.toString()),
                    Text(state.taskList[index].title),
                    Text(state.taskList[index].text),
                    IconButton(
                      onPressed: () {
                        final bloc = context.read<TaskBloc>();
                        bloc.add(
                            TaskDeleteEvent(taskId: state.taskList[index].id));
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                        onPressed: () {
                          final bloc = context.read<TaskBloc>(); //??
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: bloc,
                                child: UpdateTask(
                                  id: state.taskList[index].id,
                                  title: state.taskList[index].title,
                                  text: state.taskList[index].text,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.update))
                  ],
                );
              },
            ),
          );
        }
        if (state is TaskLoadingState) {
          return CircularProgressIndicator();
        }
        if (state is TaskErrorState) {
          return Text(state.message);
        } else {
          return Column();
        }
      },
    );
  }
}
