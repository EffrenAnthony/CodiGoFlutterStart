import 'package:flutter/material.dart';
import 'package:flutter_controll_tareas/util/dbhelper.dart';
import 'package:flutter_controll_tareas/widgets/task_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ControlTareas(),
    );
  }
}

class ControlTareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Control de Tareas"),
          bottom: TabBar(tabs: [
            Tab(
              text: "To Do",
            ),
            Tab(
              text: "Doing",
            ),
            Tab(
              text: "Done",
            )
          ]),
        ),
        body: TabBarView(children: [TaskList(), Text("doing"), Text("done")]),
        floatingActionButton: FloatingActionButton(onPressed: () {
          DbHelper helper = DbHelper();
          helper.testDb();
        }),
      ),
    );
  }
}
