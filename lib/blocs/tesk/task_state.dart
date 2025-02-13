import 'package:bloc_todo/models/task.dart';
import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  TaskState(this.tasks);

  @override
  List<Object> get props => [tasks];
}
