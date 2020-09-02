import 'package:flutter/material.dart';
import 'package:flutter_timer/models/timerModel.dart';
import 'package:flutter_timer/screens/settings.dart';
import 'package:flutter_timer/widgets/timer.dart';
import 'package:flutter_timer/widgets/timerButton.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  CountDownTimer timer = CountDownTimer();

  void goToSettings(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SettingScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem> menuItems = List();

    menuItems.add(
      PopupMenuItem(child: Text('Configuración'), value: 'settings'),
    );
    // timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) {
              return menuItems.toList();
            },
            onSelected: (route) {
              if (route == 'settings') {
                goToSettings(context);
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff009688),
                        text: "Trabajo",
                        size: 100,
                        onPressed: () {
                          timer.startWork();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff607D8B),
                        text: "Break corto",
                        size: 100,
                        onPressed: () {
                          timer.startBreak(true);
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff455A64),
                        text: "Break largo",
                        size: 100,
                        onPressed: () {
                          timer.startBreak(false);
                        }),
                  ),
                ],
              ),
            ),
            // ? Stream Builder me permite crear este elemento en base a un grupo de datos, en base a un streamer
            StreamBuilder<Object>(
                // ?El stream viene de timer que proviene de la clase CountDownTimer , en si jalamos el yield
                stream: timer.stream(),
                // ? snapshot tiene la informacion del streamer
                builder: (context, snapshot) {
                  // ?Creamos un objeto llamado model de tipo TimerModel porque ese objeto devuelve el yield
                  TimerModel model;
                  if (snapshot.data != null) {
                    model = snapshot.data;
                  } else {
                    model = TimerModel("00:00", 0);
                  }
                  return Expanded(
                    child: CircularPercentIndicator(
                      radius: 200,
                      lineWidth: 10,
                      // ? Model usa snapshot data, que es la data que recibe del stream para puntar el objeto model
                      percent: model.percent,
                      restartAnimation: true,
                      center: Text(
                        model.time,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      progressColor: Color(0xff009688),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff212121),
                        text: "Stop",
                        size: 100,
                        onPressed: () {
                          timer.stopTimer();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff009688),
                        text: "Restart",
                        size: 100,
                        onPressed: () {
                          timer.startTimer();
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
