import 'package:bloc_todo/blocs/tesk/task_event.dart';
import 'package:bloc_todo/blocs/tesk/task_state.dart';
import 'package:bloc_todo/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskState(taskRepository.getTasks())) {
    on<AddTask>((event, emit) {
      taskRepository.addTask(event.task);
      emit(TaskState(taskRepository.getTasks()));
    });
    on<ToggleTask>((event, emit) {
      taskRepository.toggleTask(event.taskId);
      emit(TaskState(taskRepository.getTasks()));
    });
    on<DeleteTask>((event, emit) {
      taskRepository.deleteTask(event.taskId);
      emit(TaskState(taskRepository.getTasks()));
    });
  }
}
