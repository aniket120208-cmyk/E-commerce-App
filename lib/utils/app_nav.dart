import 'package:flutter/foundation.dart';

class AppNav {
  AppNav._();

  static const int discover = 0;
  static const int explore = 1;
  static const int bag = 2;
  static const int orders = 3;
  static const int profile = 4;

  static final ValueNotifier<int> tab = ValueNotifier<int>(discover);
}
