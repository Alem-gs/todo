//import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; //we can use foundation.dart for the changeNotifier since it is lighter than material.dart
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'buy bread'),
  ];
//the following code is to reduce typing tasks.length in other pages
  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task taskN) {
    taskN.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task taskH) {
    tasks.remove(taskH);
    notifyListeners();
  }
}
