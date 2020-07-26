import 'dart:ffi';

import 'dart:math';

void main(List<String> args) {
  double num1 = 14;
  double num2 = 7;
  double num3 = 2;
  double sub_max = max(num1, num2);
  double num_max = max(sub_max, num3);
  double mcm = num_max;

  while (mcm % num1 != 0 || mcm % num2 != 0 || mcm % num3 != 0) {
    mcm++;
  }
  print(mcm);
}
