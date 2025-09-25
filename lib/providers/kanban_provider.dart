import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';

class KanbanProvider with ChangeNotifier {
  KanbanStatus kanbanStatus = .todo;
  List<(KanbanStatus status, String title)> items = [];

  void _refreshUI() {
    //코틀린,자바에선 private fun 사용하나  다트에선 _를 사용하여 private 처리
    // 변수가 변경됨을 알리려면 (UI에게) 필요함 필수 데이터 전달용
    notifyListeners();
  }
    void setKanbanStatus(KanbanStatus status){
      if(kanbanStatus == status) return ;
    
      kanbanStatus = status;
      
      _refreshUI();
    }
    ///아이템 추가
    void addItem(KanbanStatus status,String value){
      items.add((status, value));
      notifyListeners();
    }
    ///아이템 삭제
    void deleteItemIndex(int index){
      items.removeAt(index);
      notifyListeners();
    }
}
