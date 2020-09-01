import 'dart:async';

import 'package:flutter_timer/models/timerModel.dart';

class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;
  Timer timer;
  Duration _time;
  Duration _fulltime;

  String returnTime(Duration t) {
    String minutes = t.inMinutes < 10
        ? '0' + t.inMinutes.toString()
        : t.inMinutes.toString();
    String seconds = t.inSeconds < 10
        ? '0' + t.inSeconds.toString()
        : t.inSeconds.toString();
    return minutes + ":" + seconds;
  }

// el asterisco indica que la función asincrona retorna algun valor
// este stream con el metodo steam va a retornar cada x tiempo un valor por medio de yeld
  Stream<TimerModel> steam() async* {
    // yield retorna cada X tiempo, por eso se coloca la duración en segundos
    yield* Stream.periodic(Duration(seconds: 1), (i) {
      String time;
      if (this._isActive) {
        _time = _time - Duration(seconds: 1);
        _radius = _time.inSeconds / _fulltime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }
      time = returnTime(_time);
      return TimerModel(time, _radius);
    });
    // se va a ejecutar el print una vez que se ejecute todo el yield
    print('Terminó');
  }
}
