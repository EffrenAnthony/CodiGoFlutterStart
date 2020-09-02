import 'package:flutter/material.dart';
import 'package:flutter_timer/widgets/timerButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuracion'),
      ),
      body: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController txtWork;
  TextEditingController txtShort;
  TextEditingController txtLong;

  // ?Nos permite leer y guardar la información
  SharedPreferences prefs;

  void readSettings() async {
    prefs = await SharedPreferences.getInstance();
    int workTime = prefs.getInt('workTime');
    int shortTime = prefs.getInt('shortTime');
    int longTime = prefs.getInt('longTime');

    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortTime.toString();
      txtLong.text = longTime.toString();
    });
  }

  void updateSettings() {
    prefs.setInt("workTime", int.parse(txtWork.text));
    prefs.setInt('shortTime', int.parse(txtShort.text));
    prefs.setInt('longTime', int.parse(txtLong.text));
  }

  void increaseValue(TextEditingController controller) {
    controller.text = (int.parse(controller.text) + 1).toString();
  }

  void decreaseValue(controller) {
    controller.text = (int.parse(controller.text) - 1).toString();
  }

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
    readSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Trabajo'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Row(
              children: [
                TimerButton(
                  color: Color(0xff009688),
                  text: '-',
                  size: 100,
                  onPressed: () {
                    decreaseValue(txtWork);
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: txtWork,
                    keyboardType: TextInputType.number,
                  ),
                ),
                TimerButton(
                  color: Color(0xff009688),
                  text: '+',
                  size: 100,
                  onPressed: () {
                    increaseValue(txtWork);
                  },
                ),
              ],
            ),
          ),
          Text('Break Corto'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Row(
              children: [
                TimerButton(
                  color: Color(0xff009688),
                  text: '-',
                  size: 100,
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: txtShort,
                    keyboardType: TextInputType.number,
                  ),
                ),
                TimerButton(
                  color: Color(0xff009688),
                  text: '+',
                  size: 100,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Text('Break Largo'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Row(
              children: [
                TimerButton(
                  color: Color(0xff009688),
                  text: '-',
                  size: 100,
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: txtLong,
                    keyboardType: TextInputType.number,
                  ),
                ),
                TimerButton(
                  color: Color(0xff009688),
                  text: '+',
                  size: 100,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: RaisedButton(
              onPressed: () {
                updateSettings();
              },
              child: Text('Guardar'),
            ),
          )
        ],
      ),
    );
  }
}
