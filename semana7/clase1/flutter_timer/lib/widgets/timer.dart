import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter_timer/models/timerModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;
  Timer timer;
  Duration _time;
  Duration _fulltime;
  int work = 30;
  int longBreak = 20;
  int shortBreak = 2;
  SharedPreferences prefs;
  // AudioCache player = AudioCache();
  final player = AudioCache();

  void startWork() async {
    await readSettings();
    _radius = 1;
    _time = Duration(minutes: work);
    _fulltime = _time;
    _isActive = true;
  }

  void startBreak(bool isShort) async {
    await readSettings();
    _radius = 1;
    _time = Duration(minutes: isShort ? shortBreak : longBreak);
    _fulltime = _time;
    _isActive = true;
  }

  void stopTimer() {
    _isActive = false;
  }

  void startTimer() {
    _isActive = true;
  }

  void readSettings() async {
    prefs = await SharedPreferences.getInstance();
    print(prefs);
    work = prefs.getInt('workTime');
    shortBreak = prefs.getInt('shortTime');
    longBreak = prefs.getInt('longTime');
  }

  String returnTime(Duration t) {
    String minutes = t.inMinutes < 10
        ? '0' + t.inMinutes.toString()
        : t.inMinutes.toString();
    int segundosRestantes = t.inSeconds - t.inMinutes * 60;
    String seconds = segundosRestantes < 10
        ? '0' + segundosRestantes.toString()
        : segundosRestantes.toString();
    return minutes + ":" + seconds;
  }

// el asterisco indica que la función asincrona retorna algun valor
// este stream con el metodo steam va a retornar cada x tiempo un valor por medio de yeld
  Stream<TimerModel> stream() async* {
    // yield retorna cada X tiempo, por eso se coloca la duración en segundos
    yield* Stream.periodic(Duration(seconds: 1), (i) {
      String time;
      if (this._isActive) {
        _time = _time - Duration(seconds: 1);
        _radius = _time.inSeconds / _fulltime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
          player.play('alert.mp3');
        }
      }
      if (_time.inSeconds % 10 == 0) {
        player.play('alert.mp3');
      }
      if (_time.inSeconds <= 0 && !_isActive) {
        player.play('alert.mp3');
      }
      time = returnTime(_time);
      // ?Aqui construimos un objeto TimerModel cada vez que se hace yield para usar en el streambuilder en main
      return TimerModel(time, _radius);
    });
    // se va a ejecutar el print una vez que se ejecute todo el yield
    print('Terminó');
  }
}
