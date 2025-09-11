import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provider.dart';
import 'package:provider/provider.dart';

class DoneProgressIndicator extends StatelessWidget {
  const DoneProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProvider>(
      builder: (_, provider, children) {
        final todoCount = 3;
        final doneCount = 0;
        //완료된 비율 계산용
        final progress = (todoCount == 0) ? 0.0 : doneCount / todoCount;
        final valueString = todoCount == 0 ? '없음' : '$doneCount/$todoCount완료';
        return Row(
          spacing: 8,
          mainAxisSize:.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                color: Colors.green,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            Text(valueString, style: TextStyle(fontSize: 20)),
          ],
        );
      },
    );
  }
}
