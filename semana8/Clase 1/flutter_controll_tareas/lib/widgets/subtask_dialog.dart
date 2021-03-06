import 'package:flutter/material.dart';
import 'package:flutter_controll_tareas/models/subtask.dart';
import 'package:flutter_controll_tareas/models/task.dart';
import 'package:flutter_controll_tareas/util/dbhelper.dart';

class SubTaskDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPriority = TextEditingController();

  Widget buildDialog(
      BuildContext context, SubTask subTask, bool isNew, Task task) {
    if (isNew) {
      txtName.text = "";
      txtPriority.text = "";
    } else {
      txtName.text = subTask.name;
      txtPriority.text = subTask.priority;
    }

    return AlertDialog(
      title: Text(isNew ? "Nueva SubTarea" : "Editar SubTarea"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                hintText: "Nombre",
              ),
            ),
            TextField(
              controller: txtPriority,
              decoration: InputDecoration(
                hintText: "Prioridad",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () async {
                    DbHelper helper = DbHelper();
                    subTask.name = txtName.text;
                    subTask.priority = txtPriority.text;
                    await helper.insertSubTask(subTask, task.id);
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
                RaisedButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: Text("Cancelar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
