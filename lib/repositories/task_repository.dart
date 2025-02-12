import 'package:bloc_todo/models/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  List<Task> getTasks() {
    return List.unmodifiable(_tasks);
  }

  void addTask(Task task) {
    _tasks.add(task);
  }

  void toggleTask(String taskId) {
    int index = _tasks.indexWhere((task) => task.id == taskId);
    if (index != -1) {
      _tasks[index] =
          _tasks[index].copyWith(isCompleted: !_tasks[index].isCompleted);
    }
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
  }
}
