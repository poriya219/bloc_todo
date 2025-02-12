import 'package:bloc_todo/models/task.dart';
import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);

  @override
  List<Object> get props => [task];
}

class ToggleTask extends TaskEvent {
  final String taskId;
  ToggleTask(this.taskId);
  @override
  List<Object> get props => [taskId];
}

class DeleteTask extends TaskEvent {
  final String taskId;
  DeleteTask(this.taskId);
  @override
  List<Object> get props => [taskId];
}
