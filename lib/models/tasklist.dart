import 'package:flutter/material.dart';

class TaskList {
  int taskId;
  String title;
  String Description;
  bool important;
  DateTime createdAt;
  bool isCompleted;
  TaskList({
    required this.taskId,
    required this.title,
    required this.Description,
    this.important = false,
    required this.createdAt,
    this.isCompleted = false,
  });
}
