import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskcompleted;
  Function(bool?)? onChange;
  Function(BuildContext)? deletedata;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskcompleted,
      required this.onChange,
      required this.deletedata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletedata,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 247, 112, 102),
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Checkbox(
                  value: taskcompleted,
                  onChanged: onChange,
                  activeColor: Colors.black,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 9, 9, 9)),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 219, 150, 247),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
