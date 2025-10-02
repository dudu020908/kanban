import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/models/kanban_item.dart';
import 'package:uuid/uuid.dart';

class KanbanProvider with ChangeNotifier {
  KanbanStatus kanbanStatus = .todo;
  List<KanbanItem> items = [];

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
    void addItem(KanbanStatus status,String title){
      items.add(KanbanItem(id:Uuid().v4(),
       status: status,
        title: title));
      notifyListeners();
    }
    ///아이템 삭제
    void deleteItem(String id){
      items.removeWhere((e)=>e.id==id);
      notifyListeners();
    }

    
}
