import 'package:flutter/material.dart';
import 'package:flutter_controll_tareas/models/subtask.dart';
import 'package:flutter_controll_tareas/models/task.dart';
import 'package:flutter_controll_tareas/util/dbhelper.dart';
import 'package:flutter_controll_tareas/widgets/subtask_dialog.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> list = List();
  DbHelper helper = DbHelper();
  List<Color> colores = [Colors.red, Colors.amber, Colors.green];
  SubTaskDialog subTaskDialog = SubTaskDialog();

  Future showData() async {
    await helper.openDb();
    list = await helper.getTasks();
    for (var i = 0; i < list.length; i++) {
      list[i].subTasks = await helper.getSubTasks(list[i].id);
    }
    setState(() {
      list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => list[index].subTasks.length == 0
          ? ListTile(
              title: Text(
                list[index].id.toString() + " " + list[index].name,
              ),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => subTaskDialog.buildDialog(
                        context, SubTask(null, "", "", 0), true, list[index]),
                  );
                },
              ),
            )
          : ExpansionTile(
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => subTaskDialog.buildDialog(
                        context, SubTask(null, "", "", 0), true, list[index]),
                  );
                  // print(await helper.insertSubTask(
                  //     SubTask(null, 'Prueba', 'prueba', 1), list[index].id));
                },
              ),
              initiallyExpanded: true,
              title: Text(
                list[index].name,
              ),
              children: [
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list[index].subTasks.length,
                    itemBuilder: (c, i) => Card(
                      color: colores[list[index].subTasks[i].state],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(list[index].subTasks[i].name),
                              Text(list[index].subTasks[i].priority),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
