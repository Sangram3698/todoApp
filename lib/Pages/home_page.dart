import 'package:flutter/material.dart';
import 'package:todo/Utility/dialogue_box.dart';
import 'package:todo/Utility/todoTile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/dataBase.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  final _box = Hive.box('mybox');

  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBox(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveData() {
    setState(() {
      db.toDoList.add([_controller.text.toString(), false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createDialogueBox() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            saveFun: saveData,
            cancelFun: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 198, 238),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "ToDo",
            style: TextStyle(fontSize: 20.2, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskcompleted: db.toDoList[index][1],
            onChange: (value) => checkBox(value, index),
            deletedata: (BuildContext) {
              deleteTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createDialogueBox();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
