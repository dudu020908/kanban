import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:kanban/themes/app_size.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StatusIsland extends StatelessWidget {
  final KanbanStatus status;

  const StatusIsland({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.statusIslandHeight,
      child: Row(
        spacing: 7,
        children: [
          Expanded(
            child: Container(
              height: AppSize.statusIslandHeight,
              decoration: BoxDecoration(
                color: status.bubbleColor,
                borderRadius: BorderRadius.circular(
                  AppSize.statusIslandHeight + 10,
                ),
              ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              spacing: 7,
                      crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(status.icon,size: 26),
                Expanded(
                  child: Text(
                  status.label,
                  style: TextStyle(
                    fontWeight: .w600,
                  ),
                ),) 
              ],
            ),
            ),
          ),
          _buildCircleBubble(
            child: Text('2',style: TextStyle(fontWeight: .w600,fontSize: 20)),
          ),
          _buildCircleBubble(
            onTap: () => { 
              debugPrint('$status추가하기'),
              context.read<KanbanProvider>().addItem(status, 'New Task')
              },
            visible: status !=KanbanStatus.done,
            child: Icon(LucideIcons.plus ,size: 24), 
          ),
        ],
      ),
    );
  }

  Widget _buildCircleBubble({required Widget child,VoidCallback? onTap, bool visible = true}) {
    if(!visible){
      return SizedBox(
        width: AppSize.statusIslandHeight,
      height: AppSize.statusIslandHeight,);
    }
    return InkWell( 
    onTap: onTap,
    child: Container(
      width: AppSize.statusIslandHeight,
      height: AppSize.statusIslandHeight,
      alignment: .center,
      decoration: BoxDecoration(
        color: status.bubbleColor,
        shape: BoxShape.circle,
      ) ,
      child: child,
    ));
  }
}
