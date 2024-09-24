import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';

import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //we can also use manual listview instead of listview builder
    // ListView(
    //   children: [
    //     TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone),
    //     TaskTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone),
    //     TaskTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone),
    //   ],
    // );
    return Consumer<TaskData>(builder: (context, sthName, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          //index of the list view
          return TaskTile(
            //index of the list view
            isChecked: sthName.tasks[index].isDone,
            //we replaced Provider.of<TaskData>(context) by sthName just by using consumer
            taskTitle: sthName.tasks[index].name,
            checkBoxCallBack: (bool? newValue) {
              sthName.updateTask(sthName.tasks[index]);
            },
            longPressCallBack: (_) {
              sthName.deleteTask(sthName.tasks[index]);
            },
          );
        },
        itemCount: sthName
            .taskCount, //taskCount is same as tasks.length check on task_data.dart
      );
    });
  }
}
