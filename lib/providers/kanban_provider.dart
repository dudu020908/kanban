import 'package:flutter/material.dart';

class KanbanProvider with ChangeNotifier {
  int value = 0;
  void addValue() {
    value++;
    debugPrint('변수 변경 : value = $value');
    notifyListeners(); // 변수가 변경됨을 알리려면 (UI에게) 필요함 필수 데이터 전달용
  }
}
