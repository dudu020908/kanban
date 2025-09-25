import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KanbanItem extends StatelessWidget {
  final KanbanStatus status;
  final String title;
  final VoidCallback onCheckbox;
  final VoidCallback onDelete;
  final VoidCallback? onstatus;

  const KanbanItem({
    super.key,
    required this.status,
    required this.title,
    required this.onCheckbox,
    required this.onDelete,
    this.onstatus,
         });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      columnCrossAxisAlignment: .start,
      title: Row(
        children: [
          Checkbox(
                    //체크박스
            visualDensity: .compact,
            value: status == KanbanStatus.done, onChanged: (_) =>{onCheckbox(),
           
            }),
        //타이틀
        Expanded(child: Text('$KanbanItem',maxLines: 2,
        overflow:TextOverflow.ellipsis
        ,style: TextStyle(fontSize: 20,fontWeight: .w600))),
        //X버튼
        IconButton(
          onPressed: ()=>{onDelete()}, 
          padding: EdgeInsets.zero,
        icon: Icon(LucideIcons.x),
        iconSize: 24,),]),
      //
      footer: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
            decoration: BoxDecoration(
              color: Color(0xFFE1FBD6),
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text('Low'),
          ),
          SizedBox(width: 48,height: 48,
          child: 
          (status != KanbanStatus.done) ?
          IconButton(onPressed: (){onstatus;
          },
          visualDensity: VisualDensity.compact,
          iconSize: 30, icon: Icon(status.nexticon),)
          : const SizedBox.shrink(),
          )],)
      );
  }
}
