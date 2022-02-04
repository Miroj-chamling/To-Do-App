import 'package:flutter/material.dart';
import 'package:todo_app/models/tasklist.dart';

class AddTask extends ChangeNotifier {
  List<TaskList> _taskList = [
    TaskList(
      taskId: 1,
      title: "Play football",
      Description: "We have a very important match against real madrid.",
      createdAt: DateTime.now(),
    ),
    TaskList(
      taskId: 2,
      title: "Study for exam",
      Description: "The exam is from the next week.",
      important: true,
      createdAt: DateTime.now(),
    ),
  ];
  List<TaskList> get addedtask {
    return [..._taskList];
  }
}
