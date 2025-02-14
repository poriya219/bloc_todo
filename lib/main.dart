import 'package:bloc_todo/blocs/tesk/task_bloc.dart';
import 'package:bloc_todo/blocs/tesk/task_event.dart';
import 'package:bloc_todo/blocs/tesk/task_state.dart';
import 'package:bloc_todo/models/task.dart';
import 'package:bloc_todo/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TaskBloc(TaskRepository()),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return ListTile(
                title: Text(task.title,
                    style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : null)),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<TaskBloc>().add(DeleteTask(task.id));
                  },
                ),
                onTap: () {
                  context.read<TaskBloc>().add(ToggleTask(task.id));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final task = Task(
              id: DateTime.now().toString(),
              title: 'New Task',
              isCompleted: false,
              description: 'Empty description');
          context.read<TaskBloc>().add(AddTask(task));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
