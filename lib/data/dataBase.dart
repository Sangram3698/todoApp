import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _box = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["A new Journey", false],
    ];
  }

  void loadData() {
    toDoList = _box.get("TODOLIST");
  }

  void updateData() {
    _box.put("TODOLIST", toDoList);
  }
}
