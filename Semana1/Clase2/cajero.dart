import 'dart:math';
void main() {
  
  const int billetes_100 = 2;
  const int billetes_50 = 4;
  const int billetes_20 = 4;
  int entregado_100=0;
  int entregado_50=0;
  int entregado_20=0;
  int solicitud = 200;
  int entregado = 0;
  int total = solicitud;
  
  do{
    solicitud = total;
    if(total > 100){
      entregado_100++;
      total -= 100;
    }else if(total < 100 && total >= 50){
      entregado_50++;
      total -= 50;
    }else if (total < 50){
      entregado_20++;
      total -= 20;
    }else {
      print('no puedo entregar eso');
    }
  }while(solicitud != entregado);
  
  print('de 100: ${entregado_100}, de 50: ${entregado_50}, de 20 ${entregado_20}');
  
  
}
